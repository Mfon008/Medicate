// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Timeline _$TimelineFromJson(Map<String, dynamic> json) => Timeline(
  status: json['status'] as String?,
  occurredAt: json['occurredAt'] == null
      ? null
      : DateTime.parse(json['occurredAt'] as String),
);

Map<String, dynamic> _$TimelineToJson(Timeline instance) => <String, dynamic>{
  'status': instance.status,
  'occurredAt': instance.occurredAt?.toIso8601String(),
};
