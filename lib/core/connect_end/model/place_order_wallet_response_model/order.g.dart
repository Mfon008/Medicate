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
  buyerTenantName: json['buyerTenantName'] as String?,
  status: json['status'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  distributorFulfillments: (json['distributorFulfillments'] as List<dynamic>?)
      ?.map((e) => DistributorFulfillment.fromJson(e as Map<String, dynamic>))
      .toList(),
  deliveryMethod: json['deliveryMethod'] as String?,
  deliveryDate: json['deliveryDate'] == null
      ? null
      : DateTime.parse(json['deliveryDate'] as String),
  timeWindowLabel: json['timeWindowLabel'] as String?,
  deliveryDetails: json['deliveryDetails'] == null
      ? null
      : DeliveryDetails.fromJson(
          json['deliveryDetails'] as Map<String, dynamic>,
        ),
  deliveryBreakdown: (json['deliveryBreakdown'] as List<dynamic>?)
      ?.map((e) => DeliveryBreakdown.fromJson(e as Map<String, dynamic>))
      .toList(),
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
  cartClearedAt: json['cartClearedAt'] == null
      ? null
      : DateTime.parse(json['cartClearedAt'] as String),
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'orderNumber': instance.orderNumber,
  'buyerTenantId': instance.buyerTenantId,
  'buyerUserId': instance.buyerUserId,
  'buyerTenantName': instance.buyerTenantName,
  'status': instance.status,
  'items': instance.items,
  'distributorFulfillments': instance.distributorFulfillments,
  'deliveryMethod': instance.deliveryMethod,
  'deliveryDate': instance.deliveryDate?.toIso8601String(),
  'timeWindowLabel': instance.timeWindowLabel,
  'deliveryDetails': instance.deliveryDetails,
  'deliveryBreakdown': instance.deliveryBreakdown,
  'subtotal': instance.subtotal,
  'deliveryFee': instance.deliveryFee,
  'total': instance.total,
  'currency': instance.currency,
  'payment': instance.payment,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'cartClearedAt': instance.cartClearedAt?.toIso8601String(),
  'id': instance.id,
};
