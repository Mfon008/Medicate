// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_tier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanTier _$PlanTierFromJson(Map<String, dynamic> json) => PlanTier(
  id: json['id'] as String?,
  name: json['name'] as String?,
  hmoId: json['hmoId'] as String?,
  isActive: json['isActive'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  primaryColor: json['primaryColor'] as String?,
  secondaryColor: json['secondaryColor'] as String?,
  features: (json['features'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$PlanTierToJson(PlanTier instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'hmoId': instance.hmoId,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'primaryColor': instance.primaryColor,
  'secondaryColor': instance.secondaryColor,
  'features': instance.features,
};
