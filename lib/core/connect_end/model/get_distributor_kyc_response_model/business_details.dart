import 'package:json_annotation/json_annotation.dart';

part 'business_details.g.dart';

@JsonSerializable()
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
  String? importPermitNumber;
  String? gmpCertificateNumber;
  String? nafdacManufacturingLicenseNumber;
  String? productRegistrationEvidenceNumber;

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
    this.importPermitNumber,
    this.gmpCertificateNumber,
    this.nafdacManufacturingLicenseNumber,
    this.productRegistrationEvidenceNumber,

  });

  factory BusinessDetails.fromJson(Map<String, dynamic> json) {
    return _$BusinessDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessDetailsToJson(this);
}
