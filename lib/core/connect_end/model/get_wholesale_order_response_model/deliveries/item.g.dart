// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  productId: json['productId'] as String?,
  productName: json['productName'] as String?,
  sku: json['sku'] as String?,
  unit: json['unit'] as String?,
  imageUrl: json['imageUrl'] as String?,
  manufacturerName: json['manufacturerName'] as String?,
  minimumOrderQuantity: (json['minimumOrderQuantity'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  unitPrice: (json['unitPrice'] as num?)?.toDouble(),
  lineTotal: (json['lineTotal'] as num?)?.toDouble(),
  distributorId: json['distributorId'] as String?,
  distributorName: json['distributorName'] as String?,
  orderItemId: json['orderItemId'] as String?,
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'productId': instance.productId,
  'productName': instance.productName,
  'sku': instance.sku,
  'unit': instance.unit,
  'quantity': instance.quantity,
  'unitPrice': instance.unitPrice,
  'lineTotal': instance.lineTotal,
  'distributorId': instance.distributorId,
  'distributorName': instance.distributorName,
  'orderItemId': instance.orderItemId,
  'manufacturerName': instance.manufacturerName,
  'minimumOrderQuantity': instance.minimumOrderQuantity,
  'imageUrl': instance.imageUrl,
};
