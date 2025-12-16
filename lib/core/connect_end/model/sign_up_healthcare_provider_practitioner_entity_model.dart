class SignUpHealthcareProviderPractitionerEntityModel {
  String? phone;
  String? practitionerType;
  List<String>? areaOfExpertise;
  String? registrationNumber;
  String? healthcareFacilityName;

  SignUpHealthcareProviderPractitionerEntityModel({
    this.phone,
    this.practitionerType,
    this.areaOfExpertise,
    this.registrationNumber,
    this.healthcareFacilityName,
  });

  factory SignUpHealthcareProviderPractitionerEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return SignUpHealthcareProviderPractitionerEntityModel(
      phone: json['phone'] as String?,
      practitionerType: json['practitionerType'] as String?,
      areaOfExpertise: json['areaOfExpertise'] as List<String>?,
      registrationNumber: json['registrationNumber'] as String?,
      healthcareFacilityName: json['healthcareFacilityName'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'phone': phone,
    'practitionerType': practitionerType,
    'areaOfExpertise': areaOfExpertise,
    'registrationNumber': registrationNumber,
    'healthcareFacilityName': healthcareFacilityName,
  };
}
