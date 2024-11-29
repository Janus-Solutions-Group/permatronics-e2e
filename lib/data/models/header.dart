class HeaderModel {
  DateTime? formdate;
  String? customer;
  String? unitName;
  String? manufacturer;
  String? designationOfUnit;
  String? address;
  String? ratedLoad;
  String? landing;
  String? city;
  String? state;
  String? zip;
  String? serialNumber;
  String? contactName;
  String? inspector;
  String? phone;
  String? email;
  String? problemRepotedByCustomer;
  String? sendReportTo;

  HeaderModel({
    this.formdate,
    this.customer,
    this.unitName,
    this.manufacturer,
    this.designationOfUnit,
    this.address,
    this.ratedLoad,
    this.landing,
    this.city,
    this.state,
    this.zip,
    this.serialNumber,
    this.contactName,
    this.inspector,
    this.phone,
    this.email,
    this.problemRepotedByCustomer,
    this.sendReportTo,
  });

  Map<String, dynamic> toMap() {
    return {
      'formdate': formdate,
      'customer': customer,
      'unitName': unitName,
      'manufacturer': manufacturer,
      'designationOfUnit': designationOfUnit,
      'address': address,
      'ratedLoad': ratedLoad,
      'landing': landing,
      'city': city,
      'state': state,
      'zip': zip,
      'serialNumber': serialNumber,
      'contactName': contactName,
      'inspector': inspector,
      'phone': phone,
      'email': email,
      'problemRepotedByCustomer': problemRepotedByCustomer,
      'sendReportTo': sendReportTo,
    };
  }
}
