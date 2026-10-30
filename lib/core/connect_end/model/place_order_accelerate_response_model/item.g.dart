// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  orderItemId: json['orderItemId'] as String?,
  productId: json['productId'] as String?,
  productName: json['productName'] as String?,
  manufacturerName: json['manufacturerName'] as String?,
  manufacturerDistributorId: json['manufacturerDistributorId'] as String?,
  manufacturerDistributorName: json['manufacturerDistributorName'] as String?,
  assignedDistributorId: json['assignedDistributorId'] as String?,
  assignedDistributorName: json['assignedDistributorName'] as String?,
  fulfillmentGroupId: json['fulfillmentGroupId'] as String?,
  statusComments: json['statusComments'] as List<dynamic>?,
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
  'orderItemId': instance.orderItemId,
  'productId': instance.productId,
  'productName': instance.productName,
  'manufacturerName': instance.manufacturerName,
  'manufacturerDistributorId': instance.manufacturerDistributorId,
  'manufacturerDistributorName': instance.manufacturerDistributorName,
  'assignedDistributorId': instance.assignedDistributorId,
  'assignedDistributorName': instance.assignedDistributorName,
  'fulfillmentGroupId': instance.fulfillmentGroupId,
  'statusComments': instance.statusComments,
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
