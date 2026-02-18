// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
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
  phoneNumbers: (json['phoneNumbers'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  emails: (json['emails'] as List<dynamic>?)?.map((e) => e as String).toList(),
  payments: (json['payments'] as List<dynamic>?)
      ?.map((e) => Payment.fromJson(e as Map<String, dynamic>))
      .toList(),
  reminderGroupId: json['reminderGroupId'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  '_id': instance.id,
  'userId': instance.userId,
  'tenantId': instance.tenantId,
  'medication': instance.medication,
  'timeZone': instance.timeZone,
  'isActive': instance.isActive,
  'notificationChannels': instance.notificationChannels,
  'phoneNumbers': instance.phoneNumbers,
  'emails': instance.emails,
  'payments': instance.payments,
  'reminderGroupId': instance.reminderGroupId,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'user': instance.user,
};
