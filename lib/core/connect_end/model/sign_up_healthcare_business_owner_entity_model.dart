class SignUpHealthcareBusinessOwnerEntityModel {
  String? phone;
  String? healthcareProviderType;
  String? healthcareFacilityName;
  String? registrationNumber;
  String? businessAddress;
  String? state;
  String? lga;

  SignUpHealthcareBusinessOwnerEntityModel({
    this.phone,
    this.healthcareProviderType,
    this.healthcareFacilityName,
    this.registrationNumber,
    this.businessAddress,
    this.state,
    this.lga,
  });

  factory SignUpHealthcareBusinessOwnerEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return SignUpHealthcareBusinessOwnerEntityModel(
      phone: json['phone'] as String?,
      healthcareProviderType: json['healthcareProviderType'] as String?,
      healthcareFacilityName: json['healthcareFacilityName'] as String?,
      registrationNumber: json['registrationNumber'] as String?,
      businessAddress: json['businessAddress'] as String?,
      state: json['state'] as String?,
      lga: json['lga'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'phone': phone,
    'healthcareProviderType': healthcareProviderType,
    'healthcareFacilityName': healthcareFacilityName,
    'registrationNumber': registrationNumber,
    'businessAddress': businessAddress,
    'state': state,
    'lga': lga,
  };
}
