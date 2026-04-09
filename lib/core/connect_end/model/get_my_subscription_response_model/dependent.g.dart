// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dependent _$DependentFromJson(Map<String, dynamic> json) => Dependent(
  fullName: json['fullName'] as String?,
  relationship: json['relationship'] as String?,
  dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
  gender: json['gender'] as String?,
);

Map<String, dynamic> _$DependentToJson(Dependent instance) => <String, dynamic>{
  'fullName': instance.fullName,
  'relationship': instance.relationship,
  'dob': instance.dob?.toIso8601String(),
  'gender': instance.gender,
};
