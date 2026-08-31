class UpdateDistributorProfileEntityModel {
  String? distributorManufacturerName;
  String? registrationNumber;
  String? email;
  String? businessAddress;
  String? country;
  String? state;
  String? lga;

  UpdateDistributorProfileEntityModel({
    this.distributorManufacturerName,
    this.registrationNumber,
    this.email,
    this.businessAddress,
    this.country,
    this.state,
    this.lga,
  });

  factory UpdateDistributorProfileEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return UpdateDistributorProfileEntityModel(
      distributorManufacturerName:
          json['distributorManufacturerName'] as String?,
      registrationNumber: json['registrationNumber'] as String?,
      email: json['email'] as String?,
      businessAddress: json['businessAddress'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      lga: json['lga'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'distributorManufacturerName': distributorManufacturerName,
    'registrationNumber': registrationNumber,
    'email': email,
    'businessAddress': businessAddress,
    'country': country,
    'state': state,
    'lga': lga,
  };
}
