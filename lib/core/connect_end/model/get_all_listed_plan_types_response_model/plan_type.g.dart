// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanType _$PlanTypeFromJson(Map<String, dynamic> json) => PlanType(
  id: json['id'] as String?,
  name: json['name'] as String?,
  category: json['category'] as String?,
  isActive: json['isActive'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$PlanTypeToJson(PlanType instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'category': instance.category,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
