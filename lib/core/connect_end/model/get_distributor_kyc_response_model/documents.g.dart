// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Documents _$DocumentsFromJson(Map<String, dynamic> json) => Documents(
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
  gmpCertificate: json['gmpCertificate'] == null
      ? null
      : GmpCertificate.fromJson(json['gmpCertificate'] as Map<String, dynamic>),
  importPermit: json['importPermit'] == null
      ? null
      : ImportPermit.fromJson(json['importPermit'] as Map<String, dynamic>),
  manufacturerAuthorizationLetter:
      json['manufacturerAuthorizationLetter'] == null
      ? null
      : ManufacturerAuthorizationLetter.fromJson(
          json['manufacturerAuthorizationLetter'] as Map<String, dynamic>,
        ),
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

Map<String, dynamic> _$DocumentsToJson(Documents instance) => <String, dynamic>{
  'cacCertificate': instance.cacCertificate,
  'pharmaceuticalDistributionLicense':
      instance.pharmaceuticalDistributionLicense,
  'nafdacPermit': instance.nafdacPermit,
  'pharmacyCouncilLicense': instance.pharmacyCouncilLicense,
  'companyLogo': instance.companyLogo,
  'gmpCertificate': instance.gmpCertificate,
  'importPermit': instance.importPermit,
  'nafdacManufacturingLicense': instance.nafdacManufacturingLicense,
  'productRegistrationEvidence': instance.productRegistrationEvidence,
  'manufacturerAuthorizationLetter': instance.manufacturerAuthorizationLetter,
};
