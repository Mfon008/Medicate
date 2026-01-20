// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
  id: json['_id'] as String?,
  userId: json['userId'] as String?,
  tenantId: json['tenantId'] as String?,
  medication: json['medication'] == null
      ? null
      : Medication.fromJson(json['medication'] as Map<String, dynamic>),
  timeZone: json['timeZone'] as String?,
  isActive: json['isActive'] as bool?,
  notificationChannels: (json['notificationChannels'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  phoneNumbers: json['phoneNumbers'] as List<dynamic>?,
  emails: json['emails'] as List<dynamic>?,
  reminderGroupId: json['reminderGroupId'] as String?,
  payments: (json['payments'] as List<dynamic>?)
      ?.map((e) => Payment.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  user: json['user'],
);

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
  '_id': instance.id,
  'userId': instance.userId,
  'tenantId': instance.tenantId,
  'medication': instance.medication,
  'timeZone': instance.timeZone,
  'isActive': instance.isActive,
  'notificationChannels': instance.notificationChannels,
  'phoneNumbers': instance.phoneNumbers,
  'emails': instance.emails,
  'reminderGroupId': instance.reminderGroupId,
  'payments': instance.payments,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'user': instance.user,
};
