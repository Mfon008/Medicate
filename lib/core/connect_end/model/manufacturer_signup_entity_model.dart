class ManufacturerSignupEntityModel {
  String? phone;
  String? distributorManufacturerName;
  String? registrationNumber;
  String? businessAddress;
  String? state;
  String? lga;

  ManufacturerSignupEntityModel({
    this.phone,
    this.distributorManufacturerName,
    this.registrationNumber,
    this.businessAddress,
    this.lga,
    this.state,
  });

  factory ManufacturerSignupEntityModel.fromJson(Map<String, dynamic> json) {
    return ManufacturerSignupEntityModel(
      phone: json['phone'] as String?,
      distributorManufacturerName:
          json['distributorManufacturerName'] as String?,
      registrationNumber: json['registrationNumber'] as String?,
      businessAddress: json['businessAddress'] as String?,
      state: json['state'] as String?,
      lga: json['lga'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'phone': phone,
    'distributorManufacturerName': distributorManufacturerName,
    'registrationNumber': registrationNumber,
    'businessAddress': businessAddress,
    'state': state,
    'lga': lga,
  };
}
