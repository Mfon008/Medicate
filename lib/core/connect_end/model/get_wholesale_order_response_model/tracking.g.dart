// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tracking _$TrackingFromJson(Map<String, dynamic> json) => Tracking(
  status: json['status'] as String?,
  label: json['label'] as String?,
  completed: json['completed'] as bool?,
  current: json['current'] as bool?,
  occurredAt: json['occurredAt'] as String?,
);

Map<String, dynamic> _$TrackingToJson(Tracking instance) => <String, dynamic>{
  'status': instance.status,
  'label': instance.label,
  'completed': instance.completed,
  'current': instance.current,
  'occurredAt': instance.occurredAt,
};
