// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payload _$PayloadFromJson(Map<String, dynamic> json) => Payload(
  medications: (json['medications'] as List<dynamic>?)
      ?.map((e) => Medication.fromJson(e as Map<String, dynamic>))
      .toList(),
  timeZone: json['timeZone'] as String?,
  notificationChannels: (json['notificationChannels'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  emails: (json['emails'] as List<dynamic>?)?.map((e) => e as String).toList(),
  phoneNumbers: (json['phoneNumbers'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
  'medications': instance.medications,
  'timeZone': instance.timeZone,
  'notificationChannels': instance.notificationChannels,
  'emails': instance.emails,
  'phoneNumbers': instance.phoneNumbers,
};
