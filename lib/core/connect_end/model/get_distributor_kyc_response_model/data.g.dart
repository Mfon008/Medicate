// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  distributorId: json['distributorId'] as String?,
  kycStatus: json['kycStatus'] as String?,
  kycLevels: (json['kycLevels'] as List<dynamic>?)
      ?.map((e) => KycLevel.fromJson(e as Map<String, dynamic>))
      .toList(),
  level2: json['level2'] == null
      ? null
      : Level2.fromJson(json['level2'] as Map<String, dynamic>),
  level3: json['level3'] == null
      ? null
      : Level3.fromJson(json['level3'] as Map<String, dynamic>),
  businessTypes: (json['businessTypes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  currentLevel: (json['currentLevel'] as num?)?.toInt(),
  completionPercentage: (json['completionPercentage'] as num?)?.toInt(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'distributorId': instance.distributorId,
  'kycStatus': instance.kycStatus,
  'kycLevels': instance.kycLevels,
  'level2': instance.level2,
  'level3': instance.level3,
  'businessTypes': instance.businessTypes,
  'currentLevel': instance.currentLevel,
  'completionPercentage': instance.completionPercentage,
};
