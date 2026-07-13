// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
  id: json['id'] as String?,
  reminderId: json['reminderId'] as String?,
  userId: json['userId'] as String?,
  username: json['username'] as String?,
  doseTime: json['doseTime'] as String?,
  dosage: json['dosage'] as String?,
  doseId: json['doseId'] as String?,
  medicationName: json['medicationName'] as String?,
  scheduledAt: json['scheduledAt'] as String?,
  isRead: json['isRead'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  type: json['type'] as String?,
  title: json['title'] as String?,
  body: json['body'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
  readAt: json['readAt'] == null
      ? null
      : DateTime.parse(json['readAt'] as String),
);

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reminderId': instance.reminderId,
      'userId': instance.userId,
      'username': instance.username,
      'doseTime': instance.doseTime,
      'dosage': instance.dosage,
      'doseId': instance.doseId,
      'medicationName': instance.medicationName,
      'scheduledAt': instance.scheduledAt,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'type': instance.type,
      'title': instance.title,
      'body': instance.body,
      'data': instance.data,
      'readAt': instance.readAt?.toIso8601String(),
    };
