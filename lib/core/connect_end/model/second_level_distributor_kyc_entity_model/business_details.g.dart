// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessDetails _$BusinessDetailsFromJson(Map<String, dynamic> json) =>
    BusinessDetails(
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
      importPermitNumber: json['importPermitNumber'] as String?,
      gmpCertificateNumber: json['gmpCertificateNumber'] as String?,
      nafdacManufacturingLicenseNumber:
          json['nafdacManufacturingLicenseNumber'] as String?,
      productRegistrationEvidenceNumber:
          json['productRegistrationEvidenceNumber'] as String?,
    );

Map<String, dynamic> _$BusinessDetailsToJson(BusinessDetails instance) =>
    <String, dynamic>{
      'cacRegistrationNumber': ?instance.cacRegistrationNumber,
      'businessAddress': ?instance.businessAddress,
      'contactPersonName': ?instance.contactPersonName,
      'contactPersonPhoneNumber': ?instance.contactPersonPhoneNumber,
      'contactPersonEmail': ?instance.contactPersonEmail,
      'businessWebsite': ?instance.businessWebsite,
      'taxIdentificationNumber': ?instance.taxIdentificationNumber,
      'pharmaceuticalDistributionLicenseNumber':
          ?instance.pharmaceuticalDistributionLicenseNumber,
      'nafdacPermitNumber': ?instance.nafdacPermitNumber,
      'pharmacyCouncilLicenseNumber': ?instance.pharmacyCouncilLicenseNumber,
      'importPermitNumber': ?instance.importPermitNumber,
      'gmpCertificateNumber': ?instance.gmpCertificateNumber,
      'nafdacManufacturingLicenseNumber':
          ?instance.nafdacManufacturingLicenseNumber,
      'productRegistrationEvidenceNumber':
          ?instance.productRegistrationEvidenceNumber,
    };
