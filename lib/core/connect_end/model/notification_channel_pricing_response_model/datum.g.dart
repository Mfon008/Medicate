// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
  id: json['id'] as String?,
  channel: json['channel'] as String?,
  unitPrice: (json['unitPrice'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  isActive: json['isActive'] as bool?,
  isPaid: json['isPaid'] as bool?,
  configured: json['configured'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
  'id': instance.id,
  'channel': instance.channel,
  'unitPrice': instance.unitPrice,
  'currency': instance.currency,
  'isActive': instance.isActive,
  'isPaid': instance.isPaid,
  'configured': instance.configured,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
