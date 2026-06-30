// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
  id: json['id'] as String?,
  userId: json['userId'] as String?,
  tenantId: json['tenantId'],
  title: json['title'] as String?,
  payload: json['payload'] == null
      ? null
      : Payload.fromJson(json['payload'] as Map<String, dynamic>),
  paymentInitiated: json['paymentInitiated'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'tenantId': instance.tenantId,
  'title': instance.title,
  'payload': instance.payload,
  'paymentInitiated': instance.paymentInitiated,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
