import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

// Temporary SES credentials, region, sender and recipients are fetched at
// runtime from the AWS Lambda in aws/ses_credentials_lambda.py. The app
// authenticates to it with the signed-in user's Firebase ID token. No
// --dart-define flags are needed: just `flutter build apk`.

class SesAttachment {
  SesAttachment({
    required this.filename,
    required this.bytes,
    this.contentType = 'application/pdf',
  });

  final String filename;
  final Uint8List bytes;
  final String contentType;
}

class SesConfig {
  const SesConfig({
    required this.accessKeyId,
    required this.secretAccessKey,
    required this.region,
    required this.from,
    required this.toList,
    this.sessionToken,
  });

  final String accessKeyId;
  final String secretAccessKey;
  final String? sessionToken;
  final String region;
  final String from;
  final List<String> toList;

  // TODO: paste your Lambda Function URL here (not a secret; the Firebase
  // ID token is what authenticates the caller).
  static const _credentialsUrl =
      'https://gsig2szrmbgqnlfqn66napzlbq0fqdhh.lambda-url.us-west-1.on.aws/';

  /// Fetches short-lived credentials from the Lambda. Returns null when the
  /// no user is signed in.
  static Future<SesConfig?> fetch() async {
    final idToken = await FirebaseAuth.instance.currentUser?.getIdToken();
    if (idToken == null) return null;
    final resp = await http.post(
      Uri.parse(_credentialsUrl),
      headers: {'Authorization': 'Bearer $idToken'},
    );
    if (resp.statusCode < 200 || resp.statusCode >= 300) {
      throw SesException(statusCode: resp.statusCode, body: resp.body);
    }
    final j = jsonDecode(resp.body) as Map<String, dynamic>;
    return SesConfig(
      accessKeyId: j['accessKeyId'] as String,
      secretAccessKey: j['secretAccessKey'] as String,
      sessionToken: j['sessionToken'] as String,
      region: j['region'] as String,
      from: j['from'] as String,
      toList: (j['to'] as List).cast<String>(),
    );
  }
}

class SesService {
  SesService(this.config);

  final SesConfig config;

  Future<void> sendWithAttachments({
    required String subject,
    required String body,
    required List<SesAttachment> attachments,
  }) async {
    final raw = _buildMimeMessage(
      from: config.from,
      to: config.toList,
      subject: subject,
      body: body,
      attachments: attachments,
    );
    final rawBase64 = base64.encode(utf8.encode(raw));

    final form = <String, String>{
      'Action': 'SendRawEmail',
      'Source': config.from,
      'RawMessage.Data': rawBase64,
    };
    for (var i = 0; i < config.toList.length; i++) {
      form['Destinations.member.${i + 1}'] = config.toList[i];
    }

    final payload = _encodeForm(form);
    final host = 'email.${config.region}.amazonaws.com';
    final url = Uri.parse('https://$host/');
    final headers = _sigV4Headers(
      host: host,
      payload: payload,
    );

    final resp = await http.post(url, headers: headers, body: payload);
    if (resp.statusCode < 200 || resp.statusCode >= 300) {
      throw SesException(
        statusCode: resp.statusCode,
        body: resp.body,
      );
    }
  }

  Map<String, String> _sigV4Headers({
    required String host,
    required String payload,
  }) {
    final now = DateTime.now().toUtc();
    final amzDate = _amzDate(now);
    final dateStamp = amzDate.substring(0, 8);
    const service = 'ses';
    const algorithm = 'AWS4-HMAC-SHA256';
    final credentialScope =
        '$dateStamp/${config.region}/$service/aws4_request';

    final headerMap = <String, String>{
      'content-type': 'application/x-www-form-urlencoded; charset=utf-8',
      'host': host,
      'x-amz-date': amzDate,
    };
    if (config.sessionToken != null) {
      headerMap['x-amz-security-token'] = config.sessionToken!;
    }

    final sortedKeys = headerMap.keys.toList()..sort();
    final canonicalHeaders =
        sortedKeys.map((k) => '$k:${headerMap[k]!.trim()}\n').join();
    final signedHeaders = sortedKeys.join(';');
    final payloadHash = sha256.convert(utf8.encode(payload)).toString();

    final canonicalRequest = [
      'POST',
      '/',
      '',
      canonicalHeaders,
      signedHeaders,
      payloadHash,
    ].join('\n');

    final stringToSign = [
      algorithm,
      amzDate,
      credentialScope,
      sha256.convert(utf8.encode(canonicalRequest)).toString(),
    ].join('\n');

    final kDate =
        _hmac(utf8.encode('AWS4${config.secretAccessKey}'), dateStamp);
    final kRegion = _hmac(kDate, config.region);
    final kService = _hmac(kRegion, service);
    final kSigning = _hmac(kService, 'aws4_request');
    final signature = _hex(_hmac(kSigning, stringToSign));

    final authorization =
        '$algorithm Credential=${config.accessKeyId}/$credentialScope, '
        'SignedHeaders=$signedHeaders, Signature=$signature';

    return {
      ...headerMap,
      'Authorization': authorization,
    };
  }
}

class SesException implements Exception {
  SesException({required this.statusCode, required this.body});
  final int statusCode;
  final String body;

  @override
  String toString() => 'SesException($statusCode): $body';
}

enum EmailDeliveryStatus {
  success,
  networkFailure,
  notConfigured,
  serverFailure,
}

class EmailDeliveryResult {
  const EmailDeliveryResult(this.status, [this.detail]);

  final EmailDeliveryStatus status;
  final String? detail;

  bool get isSuccess => status == EmailDeliveryStatus.success;

  String get userMessage {
    switch (status) {
      case EmailDeliveryStatus.success:
        return 'Your inspection report has been emailed to the admin and saved to the device Downloads folder.';
      case EmailDeliveryStatus.networkFailure:
        return 'Email could not be sent due to a network issue. '
            'Please send the report and reference PDFs to the admin manually '
            'from the Downloads folder.';
      case EmailDeliveryStatus.notConfigured:
        return 'Email delivery is not configured in this build. '
            'Please send the report and reference PDFs to the admin manually '
            'from the Downloads folder.';
      case EmailDeliveryStatus.serverFailure:
        return 'Email could not be sent (the mail server rejected the request). '
            'Please send the report and reference PDFs to the admin manually '
            'from the Downloads folder.';
    }
  }
}

String _buildMimeMessage({
  required String from,
  required List<String> to,
  required String subject,
  required String body,
  required List<SesAttachment> attachments,
}) {
  final boundary =
      'permatronic-${DateTime.now().microsecondsSinceEpoch.toRadixString(16)}';
  final buf = StringBuffer()
    ..writeln('From: $from')
    ..writeln('To: ${to.join(', ')}')
    ..writeln('Subject: $subject')
    ..writeln('MIME-Version: 1.0')
    ..writeln('Content-Type: multipart/mixed; boundary="$boundary"')
    ..writeln()
    ..writeln('--$boundary')
    ..writeln('Content-Type: text/plain; charset=UTF-8')
    ..writeln('Content-Transfer-Encoding: 7bit')
    ..writeln()
    ..writeln(body);

  for (final att in attachments) {
    final encoded = base64.encode(att.bytes);
    final wrapped = _wrap76(encoded);
    buf
      ..writeln()
      ..writeln('--$boundary')
      ..writeln('Content-Type: ${att.contentType}; name="${att.filename}"')
      ..writeln(
          'Content-Disposition: attachment; filename="${att.filename}"')
      ..writeln('Content-Transfer-Encoding: base64')
      ..writeln()
      ..writeln(wrapped);
  }

  buf
    ..writeln()
    ..writeln('--$boundary--');
  return buf.toString();
}

String _wrap76(String input) {
  final sb = StringBuffer();
  for (var i = 0; i < input.length; i += 76) {
    final end = (i + 76 > input.length) ? input.length : i + 76;
    sb.writeln(input.substring(i, end));
  }
  return sb.toString().trimRight();
}

String _amzDate(DateTime utc) {
  String two(int n) => n.toString().padLeft(2, '0');
  return '${utc.year}${two(utc.month)}${two(utc.day)}T'
      '${two(utc.hour)}${two(utc.minute)}${two(utc.second)}Z';
}

String _encodeForm(Map<String, String> form) {
  return form.entries
      .map((e) =>
          '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value)}')
      .join('&');
}

List<int> _hmac(List<int> key, String data) {
  return Hmac(sha256, key).convert(utf8.encode(data)).bytes;
}

String _hex(List<int> bytes) {
  final sb = StringBuffer();
  for (final b in bytes) {
    sb.write(b.toRadixString(16).padLeft(2, '0'));
  }
  return sb.toString();
}
