// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
  id: json['id'] as String?,
  orderNumber: json['orderNumber'] as String?,
  placedAt: json['placedAt'] == null
      ? null
      : DateTime.parse(json['placedAt'] as String),
  status: json['status'] as String?,
  statusLabel: json['statusLabel'] as String?,
  badgeText: json['badgeText'] as String?,
  statusCounts: json['statusCounts'] == null
      ? null
      : StatusCounts.fromJson(json['statusCounts'] as Map<String, dynamic>),
  distributorCount: (json['distributorCount'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toDouble(),
  subtotal: (json['subtotal'] as num?)?.toDouble(),
  deliveryFee: (json['deliveryFee'] as num?)?.toInt(),
  deliveryBreakdown: (json['deliveryBreakdown'] as List<dynamic>?)
      ?.map((e) => DeliveryBreakdown.fromJson(e as Map<String, dynamic>))
      .toList(),
  currency: json['currency'] as String?,
  deliveryMethod: json['deliveryMethod'] as String?,
  deliveryMethodLabel: json['deliveryMethodLabel'] as String?,
  itemCount: (json['itemCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'id': instance.id,
  'orderNumber': instance.orderNumber,
  'placedAt': instance.placedAt?.toIso8601String(),
  'status': instance.status,
  'statusLabel': instance.statusLabel,
  'badgeText': instance.badgeText,
  'statusCounts': instance.statusCounts,
  'distributorCount': instance.distributorCount,
  'total': instance.total,
  'subtotal': instance.subtotal,
  'deliveryFee': instance.deliveryFee,
  'deliveryBreakdown': instance.deliveryBreakdown,
  'currency': instance.currency,
  'deliveryMethod': instance.deliveryMethod,
  'deliveryMethodLabel': instance.deliveryMethodLabel,
  'itemCount': instance.itemCount,
};
