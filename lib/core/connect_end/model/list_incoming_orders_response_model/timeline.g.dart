// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Timeline _$TimelineFromJson(Map<String, dynamic> json) => Timeline(
  status: json['status'] as String?,
  label: json['label'] as String?,
  current: json['current'] as bool?,
  completed: json['completed'] as bool?,
  occurredAt: json['occurredAt'],
);

Map<String, dynamic> _$TimelineToJson(Timeline instance) => <String, dynamic>{
  'status': instance.status,
  'label': instance.label,
  'current': instance.current,
  'completed': instance.completed,
  'occurredAt': instance.occurredAt,
};
