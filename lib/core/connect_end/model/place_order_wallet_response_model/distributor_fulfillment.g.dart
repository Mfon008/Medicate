// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distributor_fulfillment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistributorFulfillment _$DistributorFulfillmentFromJson(
  Map<String, dynamic> json,
) => DistributorFulfillment(
  distributorId: json['distributorId'] as String?,
  distributorName: json['distributorName'] as String?,
  status: json['status'] as String?,
  timeline: (json['timeline'] as List<dynamic>?)
      ?.map((e) => Timeline.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DistributorFulfillmentToJson(
  DistributorFulfillment instance,
) => <String, dynamic>{
  'distributorId': instance.distributorId,
  'distributorName': instance.distributorName,
  'status': instance.status,
  'timeline': instance.timeline,
};
