// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
  id: json['id'] as String?,
  fulfillmentGroupId: json['fulfillmentGroupId'] as String?,
  revision: (json['revision'] as num?)?.toInt(),
  orderNumber: json['orderNumber'] as String?,
  customer: json['customer'] == null
      ? null
      : Customer.fromJson(json['customer'] as Map<String, dynamic>),
  customerName: json['customerName'] as String?,
  placedAt: json['placedAt'] == null
      ? null
      : DateTime.parse(json['placedAt'] as String),
  dateOrdered: json['dateOrdered'] == null
      ? null
      : DateTime.parse(json['dateOrdered'] as String),
  currency: json['currency'] as String?,
  paymentStatus: json['paymentStatus'] as String?,
  paymentStatusLabel: json['paymentStatusLabel'] as String?,
  status: json['status'] as String?,
  statusLabel: json['statusLabel'] as String?,
  badgeText: json['badgeText'] as String?,
  statusCounts: json['statusCounts'] == null
      ? null
      : StatusCounts.fromJson(json['statusCounts'] as Map<String, dynamic>),
  itemsOrdered: (json['itemsOrdered'] as num?)?.toInt(),
  itemCount: (json['itemCount'] as num?)?.toInt(),
  orderTotal: (json['orderTotal'] as num?)?.toInt(),
  subtotal: (json['subtotal'] as num?)?.toInt(),
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  splitOrder: json['splitOrder'] as bool?,
  deliveryCount: (json['deliveryCount'] as num?)?.toInt(),
  deliveries: (json['deliveries'] as List<dynamic>?)
      ?.map((e) => Delivery.fromJson(e as Map<String, dynamic>))
      .toList(),
  fulfillmentTimeline: (json['fulfillmentTimeline'] as List<dynamic>?)
      ?.map((e) => FulfillmentTimeline.fromJson(e as Map<String, dynamic>))
      .toList(),
  orderNotes: json['orderNotes'] as String?,
  latestStatusComment: json['latestStatusComment'] as String?,
  inventoryReviewRequired: json['inventoryReviewRequired'] as bool?,
  actions: json['actions'] == null
      ? null
      : Actions.fromJson(json['actions'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'id': instance.id,
  'fulfillmentGroupId': instance.fulfillmentGroupId,
  'revision': instance.revision,
  'orderNumber': instance.orderNumber,
  'customer': instance.customer,
  'customerName': instance.customerName,
  'placedAt': instance.placedAt?.toIso8601String(),
  'dateOrdered': instance.dateOrdered?.toIso8601String(),
  'currency': instance.currency,
  'paymentStatus': instance.paymentStatus,
  'paymentStatusLabel': instance.paymentStatusLabel,
  'status': instance.status,
  'statusLabel': instance.statusLabel,
  'badgeText': instance.badgeText,
  'statusCounts': instance.statusCounts,
  'itemsOrdered': instance.itemsOrdered,
  'itemCount': instance.itemCount,
  'orderTotal': instance.orderTotal,
  'subtotal': instance.subtotal,
  'items': instance.items,
  'splitOrder': instance.splitOrder,
  'deliveryCount': instance.deliveryCount,
  'deliveries': instance.deliveries,
  'fulfillmentTimeline': instance.fulfillmentTimeline,
  'orderNotes': instance.orderNotes,
  'latestStatusComment': instance.latestStatusComment,
  'inventoryReviewRequired': instance.inventoryReviewRequired,
  'actions': instance.actions,
};
