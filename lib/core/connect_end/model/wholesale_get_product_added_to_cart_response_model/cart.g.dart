// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
  id: json['id'] as String?,
  buyerTenantId: json['buyerTenantId'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  itemCount: (json['itemCount'] as num?)?.toInt(),
  totalQuantity: (json['totalQuantity'] as num?)?.toInt(),
  subtotal: (json['subtotal'] as num?)?.toDouble(),
  currency: json['currency'] as String?,
);

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
  'id': instance.id,
  'buyerTenantId': instance.buyerTenantId,
  'items': instance.items,
  'itemCount': instance.itemCount,
  'totalQuantity': instance.totalQuantity,
  'subtotal': instance.subtotal,
  'currency': instance.currency,
};
