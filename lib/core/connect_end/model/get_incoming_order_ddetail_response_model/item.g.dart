// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  orderItemId: json['orderItemId'] as String?,
  productId: json['productId'] as String?,
  productName: json['productName'] as String?,
  sku: json['sku'] as String?,
  imageUrl: json['imageUrl'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  unitPrice: (json['unitPrice'] as num?)?.toInt(),
  lineTotal: (json['lineTotal'] as num?)?.toInt(),
  minimumOrderQuantity: (json['minimumOrderQuantity'] as num?)?.toInt(),
  packSize: (json['packSize'] as num?)?.toInt(),
  unit: json['unit'] as String?,
  fulfillmentStatus: json['fulfillmentStatus'] as String?,
  fulfillmentStatusLabel: json['fulfillmentStatusLabel'] as String?,
  fulfillmentTimeline: (json['fulfillmentTimeline'] as List<dynamic>?)
      ?.map((e) => FulfillmentTimeline.fromJson(e as Map<String, dynamic>))
      .toList(),
  actions: json['actions'] == null
      ? null
      : Actions.fromJson(json['actions'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'orderItemId': instance.orderItemId,
  'productId': instance.productId,
  'productName': instance.productName,
  'sku': instance.sku,
  'imageUrl': instance.imageUrl,
  'quantity': instance.quantity,
  'unitPrice': instance.unitPrice,
  'lineTotal': instance.lineTotal,
  'minimumOrderQuantity': instance.minimumOrderQuantity,
  'packSize': instance.packSize,
  'unit': instance.unit,
  'fulfillmentStatus': instance.fulfillmentStatus,
  'fulfillmentStatusLabel': instance.fulfillmentStatusLabel,
  'fulfillmentTimeline': instance.fulfillmentTimeline,
  'actions': instance.actions,
};
