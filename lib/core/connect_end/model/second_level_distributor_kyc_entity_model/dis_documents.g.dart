// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dis_documents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisDocuments _$DisDocumentsFromJson(Map<String, dynamic> json) => DisDocuments(
  cacCertificate: json['cacCertificate'] == null
      ? null
      : CacCertificate.fromJson(json['cacCertificate'] as Map<String, dynamic>),
  pharmaceuticalDistributionLicense:
      json['pharmaceuticalDistributionLicense'] == null
      ? null
      : PharmaceuticalDistributionLicense.fromJson(
          json['pharmaceuticalDistributionLicense'] as Map<String, dynamic>,
        ),
  nafdacPermit: json['nafdacPermit'] == null
      ? null
      : NafdacPermit.fromJson(json['nafdacPermit'] as Map<String, dynamic>),
  pharmacyCouncilLicense: json['pharmacyCouncilLicense'] == null
      ? null
      : PharmacyCouncilLicense.fromJson(
          json['pharmacyCouncilLicense'] as Map<String, dynamic>,
        ),
  companyLogo: json['companyLogo'] == null
      ? null
      : CompanyLogo.fromJson(json['companyLogo'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DisDocumentsToJson(DisDocuments instance) =>
    <String, dynamic>{
      'cacCertificate': instance.cacCertificate,
      'pharmaceuticalDistributionLicense':
          instance.pharmaceuticalDistributionLicense,
      'nafdacPermit': instance.nafdacPermit,
      'pharmacyCouncilLicense': instance.pharmacyCouncilLicense,
      'companyLogo': instance.companyLogo,
    };
