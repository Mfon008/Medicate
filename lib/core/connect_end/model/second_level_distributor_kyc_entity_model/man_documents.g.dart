// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'man_documents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManDocuments _$ManDocumentsFromJson(Map<String, dynamic> json) => ManDocuments(
  cacCertificate: json['cacCertificate'] == null
      ? null
      : CacCertificate.fromJson(json['cacCertificate'] as Map<String, dynamic>),
  companyLogo: json['companyLogo'] == null
      ? null
      : CompanyLogo.fromJson(json['companyLogo'] as Map<String, dynamic>),
  gmpCertificate: json['gmpCertificate'] == null
      ? null
      : GmpCertificate.fromJson(json['gmpCertificate'] as Map<String, dynamic>),
  nafdacManufacturingLicense: json['nafdacManufacturingLicense'] == null
      ? null
      : NafdacManufacturingLicense.fromJson(
          json['nafdacManufacturingLicense'] as Map<String, dynamic>,
        ),
  productRegistrationEvidence: json['productRegistrationEvidence'] == null
      ? null
      : ProductRegistrationEvidence.fromJson(
          json['productRegistrationEvidence'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ManDocumentsToJson(ManDocuments instance) =>
    <String, dynamic>{
      'cacCertificate': instance.cacCertificate,
      'companyLogo': instance.companyLogo,
      'gmpCertificate': instance.gmpCertificate,
      'nafdacManufacturingLicense': instance.nafdacManufacturingLicense,
      'productRegistrationEvidence': instance.productRegistrationEvidence,
    };
