// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_documents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleDocuments _$RoleDocumentsFromJson(Map<String, dynamic> json) =>
    RoleDocuments(
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
      gmpCertificate: json['gmpCertificate'] == null
          ? null
          : GmpCertificate.fromJson(
              json['gmpCertificate'] as Map<String, dynamic>,
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

Map<String, dynamic> _$RoleDocumentsToJson(RoleDocuments instance) =>
    <String, dynamic>{
      'pharmaceuticalDistributionLicense':
          instance.pharmaceuticalDistributionLicense,
      'nafdacPermit': instance.nafdacPermit,
      'pharmacyCouncilLicense': instance.pharmacyCouncilLicense,
      'gmpCertificate': instance.gmpCertificate,
      'nafdacManufacturingLicense': instance.nafdacManufacturingLicense,
      'productRegistrationEvidence': instance.productRegistrationEvidence,
    };
