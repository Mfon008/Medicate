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
  customer: json['customer'] == null
      ? null
      : Customer.fromJson(json['customer'] as Map<String, dynamic>),
  orderNotes: json['orderNotes'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  itemCount: (json['itemCount'] as num?)?.toInt(),
  subtotal: (json['subtotal'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  paymentStatus: json['paymentStatus'] as String?,
  paymentStatusLabel: json['paymentStatusLabel'] as String?,
  payment: json['payment'] == null
      ? null
      : Payment.fromJson(json['payment'] as Map<String, dynamic>),
  status: json['status'] as String?,
  statusLabel: json['statusLabel'] as String?,
  badgeText: json['badgeText'] as String?,
  statusCounts: json['statusCounts'] == null
      ? null
      : StatusCounts.fromJson(json['statusCounts'] as Map<String, dynamic>),
  actions: json['actions'] == null
      ? null
      : Actions.fromJson(json['actions'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'id': instance.id,
  'orderNumber': instance.orderNumber,
  'placedAt': instance.placedAt?.toIso8601String(),
  'customer': instance.customer,
  'orderNotes': instance.orderNotes,
  'items': instance.items,
  'itemCount': instance.itemCount,
  'subtotal': instance.subtotal,
  'currency': instance.currency,
  'paymentStatus': instance.paymentStatus,
  'paymentStatusLabel': instance.paymentStatusLabel,
  'payment': instance.payment,
  'status': instance.status,
  'statusLabel': instance.statusLabel,
  'badgeText': instance.badgeText,
  'statusCounts': instance.statusCounts,
  'actions': instance.actions,
};
