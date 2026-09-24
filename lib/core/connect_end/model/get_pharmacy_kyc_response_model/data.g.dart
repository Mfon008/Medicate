// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  pharmacyId: json['pharmacyId'] as String?,
  kycStatus: json['kycStatus'] as String?,
  kycLevels: (json['kycLevels'] as List<dynamic>?)
      ?.map((e) => KycLevel.fromJson(e as Map<String, dynamic>))
      .toList(),
  level1: json['level1'] == null
      ? null
      : Level1.fromJson(json['level1'] as Map<String, dynamic>),
  level2: json['level2'] == null
      ? null
      : Level2.fromJson(json['level2'] as Map<String, dynamic>),
  currentLevel: (json['currentLevel'] as num?)?.toInt(),
  completionPercentage: (json['completionPercentage'] as num?)?.toInt(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'pharmacyId': instance.pharmacyId,
  'kycStatus': instance.kycStatus,
  'kycLevels': instance.kycLevels,
  'level1': instance.level1,
  'level2': instance.level2,
  'currentLevel': instance.currentLevel,
  'completionPercentage': instance.completionPercentage,
};
