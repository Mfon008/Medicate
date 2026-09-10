// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  orderItemId: json['orderItemId'] as String?,
  productId: json['productId'] as String?,
  productName: json['productName'] as String?,
  fulfillmentStatus: json['fulfillmentStatus'] as String?,
  canAdvance: json['canAdvance'] as bool?,
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'orderItemId': instance.orderItemId,
  'productId': instance.productId,
  'productName': instance.productName,
  'fulfillmentStatus': instance.fulfillmentStatus,
  'canAdvance': instance.canAdvance,
};
