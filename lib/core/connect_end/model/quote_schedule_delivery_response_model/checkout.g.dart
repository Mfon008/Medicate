// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Checkout _$CheckoutFromJson(Map<String, dynamic> json) => Checkout(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  itemCount: (json['itemCount'] as num?)?.toInt(),
  totalQuantity: (json['totalQuantity'] as num?)?.toInt(),
  subtotal: (json['subtotal'] as num?)?.toDouble(),
  deliveryFee: (json['deliveryFee'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toDouble(),
  currency: json['currency'] as String?,
  deliveryMethod: json['deliveryMethod'] as String?,
  selectedWindow: json['selectedWindow'] == null
      ? null
      : SelectedWindow.fromJson(json['selectedWindow'] as Map<String, dynamic>),
  deliveryDestination: json['deliveryDestination'] == null
      ? null
      : DeliveryDestination.fromJson(
          json['deliveryDestination'] as Map<String, dynamic>,
        ),
  deliveryBreakdown: (json['deliveryBreakdown'] as List<dynamic>?)
      ?.map((e) => DeliveryBreakdown.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CheckoutToJson(Checkout instance) => <String, dynamic>{
  'items': instance.items,
  'itemCount': instance.itemCount,
  'totalQuantity': instance.totalQuantity,
  'subtotal': instance.subtotal,
  'deliveryFee': instance.deliveryFee,
  'total': instance.total,
  'currency': instance.currency,
  'deliveryMethod': instance.deliveryMethod,
  'selectedWindow': instance.selectedWindow,
  'deliveryDestination': instance.deliveryDestination,
  'deliveryBreakdown': instance.deliveryBreakdown,
};
