class BusinessDetails {
  String? cacRegistrationNumber;
  String? businessAddress;
  String? contactPersonName;
  String? contactPersonPhoneNumber;
  String? contactPersonEmail;
  String? businessWebsite;
  String? taxIdentificationNumber;
  String? pharmaceuticalDistributionLicenseNumber;
  String? nafdacPermitNumber;
  String? pharmacyCouncilLicenseNumber;

  BusinessDetails({
    this.cacRegistrationNumber,
    this.businessAddress,
    this.contactPersonName,
    this.contactPersonPhoneNumber,
    this.contactPersonEmail,
    this.businessWebsite,
    this.taxIdentificationNumber,
    this.pharmaceuticalDistributionLicenseNumber,
    this.nafdacPermitNumber,
    this.pharmacyCouncilLicenseNumber,
  });

  factory BusinessDetails.fromJson(Map<String, dynamic> json) {
    return BusinessDetails(
      cacRegistrationNumber: json['cacRegistrationNumber'] as String?,
      businessAddress: json['businessAddress'] as String?,
      contactPersonName: json['contactPersonName'] as String?,
      contactPersonPhoneNumber: json['contactPersonPhoneNumber'] as String?,
      contactPersonEmail: json['contactPersonEmail'] as String?,
      businessWebsite: json['businessWebsite'] as String?,
      taxIdentificationNumber: json['taxIdentificationNumber'] as String?,
      pharmaceuticalDistributionLicenseNumber:
          json['pharmaceuticalDistributionLicenseNumber'] as String?,
      nafdacPermitNumber: json['nafdacPermitNumber'] as String?,
      pharmacyCouncilLicenseNumber:
          json['pharmacyCouncilLicenseNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'cacRegistrationNumber': cacRegistrationNumber,
    'businessAddress': businessAddress,
    'contactPersonName': contactPersonName,
    'contactPersonPhoneNumber': contactPersonPhoneNumber,
    'contactPersonEmail': contactPersonEmail,
    'businessWebsite': businessWebsite,
    'taxIdentificationNumber': taxIdentificationNumber,
    'pharmaceuticalDistributionLicenseNumber':
        pharmaceuticalDistributionLicenseNumber,
    'nafdacPermitNumber': nafdacPermitNumber,
    'pharmacyCouncilLicenseNumber': pharmacyCouncilLicenseNumber,
  };
}
