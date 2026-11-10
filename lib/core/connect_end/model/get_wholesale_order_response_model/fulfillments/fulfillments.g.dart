// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fulfillments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fulfillments _$FulfillmentsFromJson(Map<String, dynamic> json) => Fulfillments(
  fulfillmentGroupId: json['fulfillmentGroupId'] as String?,
  assignedDistributorId: json['assignedDistributorId'] as String?,
  assignedDistributorName: json['assignedDistributorName'] as String?,
  status: json['status'] as String?,
  statusLabel: json['statusLabel'] as String?,
  orderItemIds: (json['orderItemIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  timeline: (json['timeline'] as List<dynamic>?)
      ?.map((e) => Timeline.fromJson(e as Map<String, dynamic>))
      .toList(),
  fulfillmentTimeline: (json['fulfillmentTimeline'] as List<dynamic>?)
      ?.map((e) => FulfillmentTimeline.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FulfillmentsToJson(Fulfillments instance) =>
    <String, dynamic>{
      'fulfillmentGroupId': instance.fulfillmentGroupId,
      'assignedDistributorId': instance.assignedDistributorId,
      'assignedDistributorName': instance.assignedDistributorName,
      'status': instance.status,
      'statusLabel': instance.statusLabel,
      'orderItemIds': instance.orderItemIds,
      'timeline': instance.timeline,
      'fulfillmentTimeline': instance.fulfillmentTimeline,
    };
