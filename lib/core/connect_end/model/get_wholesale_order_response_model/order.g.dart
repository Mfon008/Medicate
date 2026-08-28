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
  deliveryMethod: json['deliveryMethod'] as String?,
  deliveryMethodLabel: json['deliveryMethodLabel'] as String?,
  deliveryDate: json['deliveryDate'],
  timeWindow: json['timeWindow'] as String?,
  timeWindowLabel: json['timeWindowLabel'] as String?,
  deliveryDetails: json['deliveryDetails'] == null
      ? null
      : DeliveryDetails.fromJson(
          json['deliveryDetails'] as Map<String, dynamic>,
        ),
  orderNotes: json['orderNotes'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  subtotal: (json['subtotal'] as num?)?.toDouble(),
  deliveryFee: (json['deliveryFee'] as num?)?.toInt(),
  deliveryBreakdown: (json['deliveryBreakdown'] as List<dynamic>?)
      ?.map((e) => DeliveryBreakdown.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num?)?.toDouble(),
  currency: json['currency'] as String?,
  payment: json['payment'] == null
      ? null
      : Payment.fromJson(json['payment'] as Map<String, dynamic>),
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
  'deliveryMethod': instance.deliveryMethod,
  'deliveryMethodLabel': instance.deliveryMethodLabel,
  'deliveryDate': instance.deliveryDate?.toIso8601String(),
  'timeWindow': instance.timeWindow,
  'timeWindowLabel': instance.timeWindowLabel,
  'deliveryDetails': instance.deliveryDetails,
  'orderNotes': instance.orderNotes,
  'items': instance.items,
  'subtotal': instance.subtotal,
  'deliveryFee': instance.deliveryFee,
  'deliveryBreakdown': instance.deliveryBreakdown,
  'total': instance.total,
  'currency': instance.currency,
  'payment': instance.payment,
};
