// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  fulfillmentGroupId: json['fulfillmentGroupId'] as String?,
  nafdacRegistrationNumber: json['nafdacRegistrationNumber'] as String?,
  orderItemId: json['orderItemId'] as String?,
  productId: json['productId'] as String?,
  manufacturerDistributorId: json['manufacturerDistributorId'] as String?,
  productName: json['productName'] as String?,
  manufacturerName: json['manufacturerName'] as String?,
  manufacturerDistributorName: json['manufacturerDistributorName'] as String?,
  categoryId: json['categoryId'] as String?,
  category: json['category'] as String?,
  sku: json['sku'] as String?,
  imageUrl: json['imageUrl'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  unitPrice: (json['unitPrice'] as num?)?.toInt(),
  lineTotal: (json['lineTotal'] as num?)?.toInt(),
  minimumOrderQuantity: (json['minimumOrderQuantity'] as num?)?.toInt(),
  packSize: (json['packSize'] as num?)?.toInt(),
  unit: json['unit'] as String?,
  fulfillmentStatus: json['fulfillmentStatus'] as String?,
  fulfillmentTimeline: (json['fulfillmentTimeline'] as List<dynamic>?)
      ?.map((e) => FulfillmentTimeline.fromJson(e as Map<String, dynamic>))
      .toList(),
  currentAllocation: json['currentAllocation'] == null
      ? null
      : CurrentAllocation.fromJson(
          json['currentAllocation'] as Map<String, dynamic>,
        ),
  fulfillmentStatusLabel: json['fulfillmentStatusLabel'] as String?,
  actions: json['actions'] == null
      ? null
      : Actions.fromJson(json['actions'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'fulfillmentGroupId': instance.fulfillmentGroupId,
  'nafdacRegistrationNumber': instance.nafdacRegistrationNumber,
  'orderItemId': instance.orderItemId,
  'productId': instance.productId,
  'manufacturerDistributorId': instance.manufacturerDistributorId,
  'productName': instance.productName,
  'manufacturerName': instance.manufacturerName,
  'manufacturerDistributorName': instance.manufacturerDistributorName,
  'categoryId': instance.categoryId,
  'category': instance.category,
  'sku': instance.sku,
  'imageUrl': instance.imageUrl,
  'quantity': instance.quantity,
  'unitPrice': instance.unitPrice,
  'lineTotal': instance.lineTotal,
  'minimumOrderQuantity': instance.minimumOrderQuantity,
  'packSize': instance.packSize,
  'unit': instance.unit,
  'fulfillmentStatus': instance.fulfillmentStatus,
  'fulfillmentTimeline': instance.fulfillmentTimeline,
  'currentAllocation': instance.currentAllocation,
  'fulfillmentStatusLabel': instance.fulfillmentStatusLabel,
  'actions': instance.actions,
};
