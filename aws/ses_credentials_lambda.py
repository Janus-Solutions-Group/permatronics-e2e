"""
AWS Lambda handler: vends short-lived, SES-only AWS credentials to the app.

Flow
  1. App signs in with Firebase Auth and POSTs to this Lambda's Function URL
     with `Authorization: Bearer <Firebase ID token>`.
  2. Lambda verifies the token via Firebase's accounts:lookup REST API
     (stdlib only, no extra packages needed).
  3. Lambda calls sts:AssumeRole on a role that only allows ses:SendRawEmail
     and returns the temporary credentials plus region / from / to.
  The app then signs the SES request itself with those credentials.

Setup
  Runtime: Python 3.12 (boto3 is included). Timeout: 10s.
  Function URL: auth type NONE (the Firebase token is the authentication).

  Environment variables:
    SES_ROLE_ARN        ARN of the role to assume (see below)      [required]
    FIREBASE_API_KEY    Web API key of the Firebase project         [required]
    SES_REGION          e.g. us-east-1                              [required]
    SES_FROM            e.g. reports@permatronic.com                [required]
    SES_TO              comma-separated recipients                  [required]
    CRED_DURATION_SECS  optional, default 900 (min 900)

  SES role (SES_ROLE_ARN):
    Permissions policy:
      {"Version":"2012-10-17","Statement":[{
         "Effect":"Allow","Action":"ses:SendRawEmail","Resource":"*",
         "Condition":{"StringEquals":{"ses:FromAddress":"reports@permatronic.com"}}}]}
    Trust policy: allow this Lambda's execution role to sts:AssumeRole.
  Lambda execution role: needs sts:AssumeRole on SES_ROLE_ARN.

Request:  POST, header  Authorization: Bearer <firebase id token>
Response: {"accessKeyId","secretAccessKey","sessionToken","expiration",
           "region","from","to":[...]}
"""

import json
import os
import urllib.error
import urllib.request

import boto3

_sts = boto3.client("sts")


def _response(status, body):
    return {
        "statusCode": status,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps(body),
    }


def _bearer_token(event):
    headers = {k.lower(): v for k, v in (event.get("headers") or {}).items()}
    auth = headers.get("authorization", "")
    if auth.lower().startswith("bearer "):
        return auth[7:].strip()
    return None


def _verify_firebase_token(id_token):
    """Returns the Firebase user dict if the ID token is valid, else None."""
    url = (
        "https://identitytoolkit.googleapis.com/v1/accounts:lookup?key="
        + os.environ["FIREBASE_API_KEY"]
    )
    req = urllib.request.Request(
        url,
        data=json.dumps({"idToken": id_token}).encode(),
        headers={"Content-Type": "application/json"},
        method="POST",
    )
    try:
        with urllib.request.urlopen(req, timeout=5) as resp:
            users = json.loads(resp.read()).get("users") or []
    except urllib.error.HTTPError:
        return None
    if not users or users[0].get("disabled"):
        return None
    return users[0]


def lambda_handler(event, context):
    token = _bearer_token(event)
    if not token:
        return _response(401, {"error": "missing bearer token"})

    user = _verify_firebase_token(token)
    if user is None:
        return _response(401, {"error": "invalid token"})

    try:
        creds = _sts.assume_role(
            RoleArn=os.environ["SES_ROLE_ARN"],
            RoleSessionName=("app-" + user["localId"])[:64],
            DurationSeconds=int(os.environ.get("CRED_DURATION_SECS", "900")),
        )["Credentials"]
    except Exception as e:  # noqa: BLE001
        print("assume_role failed:", e)
        return _response(500, {"error": "could not issue credentials"})

    return _response(
        200,
        {
            "accessKeyId": creds["AccessKeyId"],
            "secretAccessKey": creds["SecretAccessKey"],
            "sessionToken": creds["SessionToken"],
            "expiration": creds["Expiration"].isoformat(),
            "region": os.environ["SES_REGION"],
            "from": os.environ["SES_FROM"],
            "to": [
                t.strip() for t in os.environ["SES_TO"].split(",") if t.strip()
            ],
        },
    )
