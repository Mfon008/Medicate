// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_breakdown.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryBreakdown _$DeliveryBreakdownFromJson(Map<String, dynamic> json) =>
    DeliveryBreakdown(
      productIds: (json['productIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      distributorIds: (json['distributorIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      distributorNames: (json['distributorNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      orderSubtotal: (json['orderSubtotal'] as num?)?.toDouble(),
      locationId: json['locationId'] as String?,
      stateCode: json['stateCode'] as String?,
      stateName: json['stateName'] as String?,
      lgaCode: json['lgaCode'] as String?,
      lgaName: json['lgaName'] as String?,
      deliveryMethod: json['deliveryMethod'] as String?,
      deliveryFee: (json['deliveryFee'] as num?)?.toInt(),
      deliveryDate: json['deliveryDate'] == null
          ? null
          : DateTime.parse(json['deliveryDate'] as String),
      timeBlock: json['timeBlock'] == null
          ? null
          : TimeBlock.fromJson(json['timeBlock'] as Map<String, dynamic>),
      logisticsPartner: json['logisticsPartner'] == null
          ? null
          : LogisticsPartner.fromJson(
              json['logisticsPartner'] as Map<String, dynamic>,
            ),
      deliveryConditions: json['deliveryConditions'] as String?,
    );

Map<String, dynamic> _$DeliveryBreakdownToJson(DeliveryBreakdown instance) =>
    <String, dynamic>{
      'productIds': instance.productIds,
      'distributorIds': instance.distributorIds,
      'distributorNames': instance.distributorNames,
      'orderSubtotal': instance.orderSubtotal,
      'locationId': instance.locationId,
      'stateCode': instance.stateCode,
      'stateName': instance.stateName,
      'lgaCode': instance.lgaCode,
      'lgaName': instance.lgaName,
      'deliveryMethod': instance.deliveryMethod,
      'deliveryFee': instance.deliveryFee,
      'deliveryDate': instance.deliveryDate?.toIso8601String(),
      'timeBlock': instance.timeBlock,
      'logisticsPartner': instance.logisticsPartner,
      'deliveryConditions': instance.deliveryConditions,
    };
