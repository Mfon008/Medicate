class BusinessDetails {
  String? cacRegistrationNumber;
  String? taxIdentificationNumber;
  String? registeredAddress;
  String? contactPersonName;
  String? contactPersonPhoneNumber;
  String? contactPersonEmail;
  String? businessWebsite;

  BusinessDetails({
    this.cacRegistrationNumber,
    this.taxIdentificationNumber,
    this.registeredAddress,
    this.contactPersonName,
    this.contactPersonPhoneNumber,
    this.contactPersonEmail,
    this.businessWebsite,
  });

  factory BusinessDetails.fromJson(Map<String, dynamic> json) {
    return BusinessDetails(
      cacRegistrationNumber: json['cacRegistrationNumber'] as String?,
      taxIdentificationNumber: json['taxIdentificationNumber'] as String?,
      registeredAddress: json['registeredAddress'] as String?,
      contactPersonName: json['contactPersonName'] as String?,
      contactPersonPhoneNumber: json['contactPersonPhoneNumber'] as String?,
      contactPersonEmail: json['contactPersonEmail'] as String?,
      businessWebsite: json['businessWebsite'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'cacRegistrationNumber': cacRegistrationNumber,
    'taxIdentificationNumber': taxIdentificationNumber,
    'registeredAddress': registeredAddress,
    'contactPersonName': contactPersonName,
    'contactPersonPhoneNumber': contactPersonPhoneNumber,
    'contactPersonEmail': contactPersonEmail,
    'businessWebsite': businessWebsite,
  };
}
