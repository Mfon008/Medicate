// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_breakdown.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryBreakdown _$DeliveryBreakdownFromJson(Map<String, dynamic> json) =>
    DeliveryBreakdown(
      productIds: json['productIds'] as List<dynamic>?,
      distributorIds: (json['distributorIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      distributorNames: (json['distributorNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      orderSubtotal: (json['orderSubtotal'] as num?)?.toInt(),
      locationId: json['locationId'] as String?,
      deliveryMethod: json['deliveryMethod'] as String?,
      deliveryFee: (json['deliveryFee'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DeliveryBreakdownToJson(DeliveryBreakdown instance) =>
    <String, dynamic>{
      'productIds': instance.productIds,
      'distributorIds': instance.distributorIds,
      'distributorNames': instance.distributorNames,
      'orderSubtotal': instance.orderSubtotal,
      'locationId': instance.locationId,
      'deliveryMethod': instance.deliveryMethod,
      'deliveryFee': instance.deliveryFee,
    };
