// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hmo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hmo _$HmoFromJson(Map<String, dynamic> json) => Hmo(
  hmoId: json['hmoId'] as String?,
  name: json['name'] as String?,
  location: json['location'] == null
      ? null
      : Location.fromJson(json['location'] as Map<String, dynamic>),
  phone: json['phone'] as String?,
  logo: json['logo'] == null
      ? null
      : Logo.fromJson(json['logo'] as Map<String, dynamic>),
  planCount: (json['planCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$HmoToJson(Hmo instance) => <String, dynamic>{
  'hmoId': instance.hmoId,
  'name': instance.name,
  'location': instance.location,
  'phone': instance.phone,
  'logo': instance.logo,
  'planCount': instance.planCount,
};
