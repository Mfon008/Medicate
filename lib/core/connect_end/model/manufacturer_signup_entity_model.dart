class ManufacturerSignupEntityModel {
  String? phone;
  String? distributorManufacturerName;
  String? registrationNumber;
  String? businessAddress;

  ManufacturerSignupEntityModel({
    this.phone,
    this.distributorManufacturerName,
    this.registrationNumber,
    this.businessAddress,
  });

  factory ManufacturerSignupEntityModel.fromJson(Map<String, dynamic> json) {
    return ManufacturerSignupEntityModel(
      phone: json['phone'] as String?,
      distributorManufacturerName:
          json['distributorManufacturerName'] as String?,
      registrationNumber: json['registrationNumber'] as String?,
      businessAddress: json['businessAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'phone': phone,
    'distributorManufacturerName': distributorManufacturerName,
    'registrationNumber': registrationNumber,
    'businessAddress': businessAddress,
  };
}
