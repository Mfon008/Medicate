// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  productId: json['productId'] as String?,
  productName: json['productName'] as String?,
  manufacturerDistributorId: json['manufacturerDistributorId'] as String?,
  manufacturerDistributorName: json['manufacturerDistributorName'] as String?,
  sku: json['sku'] as String?,
  imageUrl: json['imageUrl'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  unitPrice: (json['unitPrice'] as num?)?.toDouble(),
  lineTotal: (json['lineTotal'] as num?)?.toDouble(),
  minimumOrderQuantity: (json['minimumOrderQuantity'] as num?)?.toInt(),
  packSize: (json['packSize'] as num?)?.toInt(),
  unit: json['unit'] as String?,
  estimatedDeliveryDate: json['estimatedDeliveryDate'] == null
      ? null
      : DateTime.parse(json['estimatedDeliveryDate'] as String),
  fulfillmentStatus: json['fulfillmentStatus'] as String?,
  fulfillmentStatusLabel: json['fulfillmentStatusLabel'] as String?,
  tracking: (json['tracking'] as List<dynamic>?)
      ?.map((e) => Tracking.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'productId': instance.productId,
  'productName': instance.productName,
  'manufacturerDistributorId': instance.manufacturerDistributorId,
  'manufacturerDistributorName': instance.manufacturerDistributorName,
  'sku': instance.sku,
  'imageUrl': instance.imageUrl,
  'quantity': instance.quantity,
  'unitPrice': instance.unitPrice,
  'lineTotal': instance.lineTotal,
  'minimumOrderQuantity': instance.minimumOrderQuantity,
  'packSize': instance.packSize,
  'unit': instance.unit,
  'estimatedDeliveryDate': instance.estimatedDeliveryDate?.toIso8601String(),
  'fulfillmentStatus': instance.fulfillmentStatus,
  'fulfillmentStatusLabel': instance.fulfillmentStatusLabel,
  'tracking': instance.tracking,
};
