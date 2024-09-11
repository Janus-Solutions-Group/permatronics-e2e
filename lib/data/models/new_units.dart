// To parse this JSON data, do
//
//     final newUnitsModel = newUnitsModelFromJson(jsonString);

import 'dart:convert';

List<NewUnitsModel> newUnitsModelFromJson(String str) =>
    List<NewUnitsModel>.from(
        json.decode(str).map((x) => NewUnitsModel.fromJson(x)));

String newUnitsModelToJson(List<NewUnitsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewUnitsModel {
  final CustomerName? locationId;
  final String? zip;
  final String? landings;
  final CustomerName? customerName;
  final dynamic loadTestType;
  final String? phone;
  final String? state;
  final dynamic serialNumber;
  final String? id;
  final String? city;
  final String? name;

  NewUnitsModel({
    this.locationId,
    this.zip,
    this.landings,
    this.customerName,
    this.loadTestType,
    this.phone,
    this.state,
    this.serialNumber,
    this.id,
    this.city,
    this.name,
  });

  factory NewUnitsModel.fromJson(Map<String, dynamic> json) => NewUnitsModel(
        locationId: json["Location_ID"] == null
            ? null
            : CustomerName.fromJson(json["Location_ID"]),
        zip: json["Zip"],
        landings: json["Landings"],
        customerName: json["Customer_Name"] == null
            ? null
            : CustomerName.fromJson(json["Customer_Name"]),
        loadTestType: json["Load_Test_Type"],
        phone: json["Phone"],
        state: json["State"],
        serialNumber: json["Serial_Number"],
        id: json["id"],
        city: json["City"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Location_ID": locationId?.toJson(),
        "Zip": zip,
        "Landings": landings,
        "Customer_Name": customerName?.toJson(),
        "Load_Test_Type": loadTestType,
        "Phone": phone,
        "State": state,
        "Serial_Number": serialNumber,
        "id": id,
        "City": city,
        "Name": name,
      };
}

class CustomerName {
  final String? name;
  final String? id;

  CustomerName({
    this.name,
    this.id,
  });

  factory CustomerName.fromJson(Map<String, dynamic> json) => CustomerName(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
