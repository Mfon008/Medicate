// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  productId: json['productId'] as String?,
  productName: json['productName'] as String?,
  manufacturerDistributorName: json['manufacturerDistributorName'] as String?,
  category: json['category'] as String?,
  sku: json['sku'] as String?,
  imageUrl: json['imageUrl'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  unitPrice: (json['unitPrice'] as num?)?.toInt(),
  lineTotal: (json['lineTotal'] as num?)?.toInt(),
  minimumOrderQuantity: (json['minimumOrderQuantity'] as num?)?.toInt(),
  packSize: (json['packSize'] as num?)?.toInt(),
  unit: json['unit'] as String?,
  categoryId: json['categoryId'] as String?,
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'productId': instance.productId,
  'productName': instance.productName,
  'manufacturerDistributorName': instance.manufacturerDistributorName,
  'category': instance.category,
  'sku': instance.sku,
  'imageUrl': instance.imageUrl,
  'quantity': instance.quantity,
  'unitPrice': instance.unitPrice,
  'lineTotal': instance.lineTotal,
  'minimumOrderQuantity': instance.minimumOrderQuantity,
  'packSize': instance.packSize,
  'unit': instance.unit,
  'categoryId': instance.categoryId,
};
