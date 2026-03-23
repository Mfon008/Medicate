// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
  id: json['id'] as String?,
  name: json['name'] as String?,
  logo: json['logo'] == null
      ? null
      : Logo.fromJson(json['logo'] as Map<String, dynamic>),
  businessAddress: json['businessAddress'] as String?,
  phone: json['phone'] as String?,
  planCount: (json['planCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'logo': instance.logo,
  'businessAddress': instance.businessAddress,
  'phone': instance.phone,
  'planCount': instance.planCount,
};
