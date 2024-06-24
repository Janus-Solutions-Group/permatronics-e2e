import 'dart:convert';

List<CustomerDetail> customerDetailFromJson(String str) =>
    List<CustomerDetail>.from(
        json.decode(str).map((x) => CustomerDetail.fromJson(x)));

String customerDetailToJson(List<CustomerDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerDetail {
  final String? zip;
  final String? phone;
  final String? state;
  final String? website;
  final String? accountName;
  final String? id;
  final String? city;
  final String? mailingAddress;

  CustomerDetail({
    this.zip,
    this.phone,
    this.state,
    this.website,
    this.accountName,
    this.id,
    this.city,
    this.mailingAddress,
  });

  factory CustomerDetail.fromJson(Map<String, dynamic> json) => CustomerDetail(
        zip: json["Zip"],
        phone: json["Phone"],
        state: json["State"],
        website: json["Website"],
        accountName: json["Account_Name"],
        id: json["id"],
        city: json["City"],
        mailingAddress: json["Mailing_Address"],
      );

  Map<String, dynamic> toJson() => {
        "Zip": zip,
        "Phone": phone,
        "State": state,
        "Website": website,
        "Account_Name": accountName,
        "id": id,
        "City": city,
        "Mailing_Address": mailingAddress,
      };
}
