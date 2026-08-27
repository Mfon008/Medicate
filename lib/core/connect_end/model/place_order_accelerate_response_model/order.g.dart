// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
  id: json['id'] as String?,
  orderNumber: json['orderNumber'] as String?,
  buyerTenantId: json['buyerTenantId'] as String?,
  buyerUserId: json['buyerUserId'] as String?,
  status: json['status'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  deliveryMethod: json['deliveryMethod'] as String?,
  deliveryDate: json['deliveryDate'] == null
      ? null
      : DateTime.parse(json['deliveryDate'] as String),
  timeWindow: json['timeWindow'] as String?,
  timeWindowLabel: json['timeWindowLabel'] as String?,
  deliveryDetails: json['deliveryDetails'] == null
      ? null
      : DeliveryDetails.fromJson(
          json['deliveryDetails'] as Map<String, dynamic>,
        ),
  subtotal: (json['subtotal'] as num?)?.toInt(),
  deliveryFee: (json['deliveryFee'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  payment: json['payment'] == null
      ? null
      : Payment.fromJson(json['payment'] as Map<String, dynamic>),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  deliveryBreakdown: (json['deliveryBreakdown'] as List<dynamic>?)
      ?.map((e) => DeliveryBreakdown.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'id': instance.id,
  'orderNumber': instance.orderNumber,
  'buyerTenantId': instance.buyerTenantId,
  'buyerUserId': instance.buyerUserId,
  'status': instance.status,
  'items': instance.items,
  'deliveryMethod': instance.deliveryMethod,
  'deliveryDate': instance.deliveryDate?.toIso8601String(),
  'timeWindow': instance.timeWindow,
  'timeWindowLabel': instance.timeWindowLabel,
  'deliveryDetails': instance.deliveryDetails,
  'subtotal': instance.subtotal,
  'deliveryFee': instance.deliveryFee,
  'total': instance.total,
  'currency': instance.currency,
  'payment': instance.payment,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'deliveryBreakdown': instance.deliveryBreakdown,
};
