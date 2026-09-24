// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level2 _$Level2FromJson(Map<String, dynamic> json) => Level2(
  meansOfIdType: json['meansOfIdType'] as String?,
  meansOfIdDocument: json['meansOfIdDocument'] == null
      ? null
      : MeansOfIdDocument.fromJson(
          json['meansOfIdDocument'] as Map<String, dynamic>,
        ),
  cacCertificate: json['cacCertificate'] == null
      ? null
      : CacCertificate.fromJson(json['cacCertificate'] as Map<String, dynamic>),
  pharmacyLicense: json['pharmacyLicense'] == null
      ? null
      : PharmacyLicense.fromJson(
          json['pharmacyLicense'] as Map<String, dynamic>,
        ),
  taxIdentificationNumberDocument:
      json['taxIdentificationNumberDocument'] == null
      ? null
      : TaxIdentificationNumberDocument.fromJson(
          json['taxIdentificationNumberDocument'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$Level2ToJson(Level2 instance) => <String, dynamic>{
  'meansOfIdType': instance.meansOfIdType,
  'meansOfIdDocument': instance.meansOfIdDocument,
  'cacCertificate': instance.cacCertificate,
  'pharmacyLicense': instance.pharmacyLicense,
  'taxIdentificationNumberDocument': instance.taxIdentificationNumberDocument,
};
