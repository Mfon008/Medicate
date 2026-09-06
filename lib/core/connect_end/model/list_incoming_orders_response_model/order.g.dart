// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
  id: json['id'] as String?,
  orderNumber: json['orderNumber'] as String?,
  customer: json['customer'] == null
      ? null
      : Customer.fromJson(json['customer'] as Map<String, dynamic>),
  customerName: json['customerName'] as String?,
  itemsOrdered: (json['itemsOrdered'] as num?)?.toInt(),
  orderTotal: (json['orderTotal'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  dateOrdered: json['dateOrdered'] == null
      ? null
      : DateTime.parse(json['dateOrdered'] as String),
  paymentStatus: json['paymentStatus'] as String?,
  paymentStatusLabel: json['paymentStatusLabel'] as String?,
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
  'customer': instance.customer,
  'customerName': instance.customerName,
  'itemsOrdered': instance.itemsOrdered,
  'orderTotal': instance.orderTotal,
  'currency': instance.currency,
  'dateOrdered': instance.dateOrdered?.toIso8601String(),
  'paymentStatus': instance.paymentStatus,
  'paymentStatusLabel': instance.paymentStatusLabel,
  'status': instance.status,
  'statusLabel': instance.statusLabel,
  'badgeText': instance.badgeText,
  'statusCounts': instance.statusCounts,
  'actions': instance.actions,
};
