// To parse this JSON data, do
//
//     final unitsDetail = unitsDetailFromJson(jsonString);

import 'dart:convert';

List<UnitsDetail> unitsDetailFromJson(String str) => List<UnitsDetail>.from(
    json.decode(str).map((x) => UnitsDetail.fromJson(x)));

String unitsDetailToJson(List<UnitsDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnitsDetail {
  final String? steps;
  final String? zip;
  final String? designation;
  final String? landings;
  final String? address;
  final String? phone;
  final String? state;
  final String? model;
  final String? id;
  final List<dynamic>? tag;
  final String? city;
  final String? notes;

  UnitsDetail({
    this.steps,
    this.zip,
    this.designation,
    this.landings,
    this.address,
    this.phone,
    this.state,
    this.model,
    this.id,
    this.tag,
    this.city,
    this.notes,
  });

  factory UnitsDetail.fromJson(Map<String, dynamic> json) => UnitsDetail(
        steps: json["Steps"],
        zip: json["Zip"],
        designation: json["Designation"],
        landings: json["Landings"],
        address: json["Address"],
        phone: json["Phone"],
        state: json["State"],
        model: json["Model"],
        id: json["id"],
        tag: json["Tag"] == null
            ? []
            : List<dynamic>.from(json["Tag"]!.map((x) => x)),
        city: json["City"],
        notes: json["Notes"],
      );

  Map<String, dynamic> toJson() => {
        "Steps": steps,
        "Zip": zip,
        "Designation": designation,
        "Landings": landings,
        "Address": address,
        "Phone": phone,
        "State": state,
        "Model": model,
        "id": id,
        "Tag": tag == null ? [] : List<dynamic>.from(tag!.map((x) => x)),
        "City": city,
        "Notes": notes,
      };
}
