// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level2 _$Level2FromJson(Map<String, dynamic> json) => Level2(
  logo: json['logo'] == null
      ? null
      : Logo.fromJson(json['logo'] as Map<String, dynamic>),
  cacCertificate: json['cacCertificate'] == null
      ? null
      : CacCertificate.fromJson(json['cacCertificate'] as Map<String, dynamic>),
  hmoAccreditation: json['hmoAccreditation'] == null
      ? null
      : HmoAccreditation.fromJson(
          json['hmoAccreditation'] as Map<String, dynamic>,
        ),
  taxIdCertificate: json['taxIdCertificate'] == null
      ? null
      : TaxIdCertificate.fromJson(
          json['taxIdCertificate'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$Level2ToJson(Level2 instance) => <String, dynamic>{
  'logo': instance.logo,
  'cacCertificate': instance.cacCertificate,
  'hmoAccreditation': instance.hmoAccreditation,
  'taxIdCertificate': instance.taxIdCertificate,
};
