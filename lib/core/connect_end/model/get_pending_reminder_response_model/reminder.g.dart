// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reminder _$ReminderFromJson(Map<String, dynamic> json) => Reminder(
  id: json['_id'] as String?,
  trackingId: json['trackingId'] as String?,
  userId: json['userId'] as String?,
  tenantId: json['tenantId'],
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
  channelPriceSnapshots: (json['channelPriceSnapshots'] as List<dynamic>?)
      ?.map((e) => ChannelPriceSnapshot.fromJson(e as Map<String, dynamic>))
      .toList(),
  reminderGroupId: json['reminderGroupId'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ReminderToJson(Reminder instance) => <String, dynamic>{
  '_id': instance.id,
  'trackingId': instance.trackingId,
  'userId': instance.userId,
  'tenantId': instance.tenantId,
  'medication': instance.medication,
  'timeZone': instance.timeZone,
  'isActive': instance.isActive,
  'notificationChannels': instance.notificationChannels,
  'phoneNumbers': instance.phoneNumbers,
  'emails': instance.emails,
  'payments': instance.payments,
  'channelPriceSnapshots': instance.channelPriceSnapshots,
  'reminderGroupId': instance.reminderGroupId,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
