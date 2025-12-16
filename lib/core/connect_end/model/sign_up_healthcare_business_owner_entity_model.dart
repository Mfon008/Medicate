class SignUpHealthcareBusinessOwnerEntityModel {
  String? phone;
  String? healthcareProviderType;
  String? healthcareFacilityName;
  String? registrationNumber;

  SignUpHealthcareBusinessOwnerEntityModel({
    this.phone,
    this.healthcareProviderType,
    this.healthcareFacilityName,
    this.registrationNumber,
  });

  factory SignUpHealthcareBusinessOwnerEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return SignUpHealthcareBusinessOwnerEntityModel(
      phone: json['phone'] as String?,
      healthcareProviderType: json['healthcareProviderType'] as String?,
      healthcareFacilityName: json['healthcareFacilityName'] as String?,
      registrationNumber: json['registrationNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'phone': phone,
    'healthcareProviderType': healthcareProviderType,
    'healthcareFacilityName': healthcareFacilityName,
    'registrationNumber': registrationNumber,
  };
}
