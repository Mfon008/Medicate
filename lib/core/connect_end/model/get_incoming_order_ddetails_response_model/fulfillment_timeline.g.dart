// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fulfillment_timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FulfillmentTimeline _$FulfillmentTimelineFromJson(Map<String, dynamic> json) =>
    FulfillmentTimeline(
      status: json['status'] as String?,
      label: json['label'] as String?,
      current: json['current'] as bool?,
      completed: json['completed'] as bool?,
      occurredAt: json['occurredAt'],
    );

Map<String, dynamic> _$FulfillmentTimelineToJson(
  FulfillmentTimeline instance,
) => <String, dynamic>{
  'status': instance.status,
  'label': instance.label,
  'current': instance.current,
  'completed': instance.completed,
  'occurredAt': instance.occurredAt,
};
