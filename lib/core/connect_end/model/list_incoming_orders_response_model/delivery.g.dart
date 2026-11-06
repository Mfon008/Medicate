// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Delivery _$DeliveryFromJson(Map<String, dynamic> json) => Delivery(
  deliveryId: json['deliveryId'] as String?,
  deliveryNumber: (json['deliveryNumber'] as num?)?.toInt(),
  orderDeliveryNumber: (json['orderDeliveryNumber'] as num?)?.toInt(),
  deliveryAddressId: json['deliveryAddressId'] as String?,
  deliveryAddress: json['deliveryAddress'] as String?,
  country: json['country'] as String?,
  state: json['state'] as String?,
  lga: json['lga'] as String?,
  recipientName: json['recipientName'] as String?,
  contactPhone: json['contactPhone'] as String?,
  recipientIdType: json['recipientIdType'] as String?,
  orderNotes: json['orderNotes'] as String?,
  deliveryDate: json['deliveryDate'],
  timeBlock: json['timeBlock'] == null
      ? null
      : TimeBlock.fromJson(json['timeBlock'] as Map<String, dynamic>),
  contactPerson: json['contactPerson'] == null
      ? null
      : ContactPerson.fromJson(json['contactPerson'] as Map<String, dynamic>),
  fulfillmentGroupId: json['fulfillmentGroupId'] as String?,
  assignedDistributorId: json['assignedDistributorId'] as String?,
  assignedDistributorName: json['assignedDistributorName'] as String?,
  revision: (json['revision'] as num?)?.toInt(),
  status: json['status'] as String?,
  nextStatus: json['nextStatus'] as String?,
  statusLabel: json['statusLabel'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  itemCount: (json['itemCount'] as num?)?.toInt(),
  quantityCount: (json['quantityCount'] as num?)?.toInt(),
  subtotal: (json['subtotal'] as num?)?.toInt(),
  timeline: (json['timeline'] as List<dynamic>?)
      ?.map((e) => Timeline.fromJson(e as Map<String, dynamic>))
      .toList(),
  fulfillmentTimeline: (json['fulfillmentTimeline'] as List<dynamic>?)
      ?.map((e) => FulfillmentTimeline.fromJson(e as Map<String, dynamic>))
      .toList(),
  history: (json['history'] as List<dynamic>?)
      ?.map((e) => History.fromJson(e as Map<String, dynamic>))
      .toList(),
  latestStatusComment: json['latestStatusComment'] as String?,
  actions: json['actions'] == null
      ? null
      : Actions.fromJson(json['actions'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DeliveryToJson(Delivery instance) => <String, dynamic>{
  'deliveryId': instance.deliveryId,
  'deliveryNumber': instance.deliveryNumber,
  'orderDeliveryNumber': instance.orderDeliveryNumber,
  'deliveryAddressId': instance.deliveryAddressId,
  'deliveryAddress': instance.deliveryAddress,
  'country': instance.country,
  'state': instance.state,
  'lga': instance.lga,
  'recipientName': instance.recipientName,
  'contactPhone': instance.contactPhone,
  'recipientIdType': instance.recipientIdType,
  'orderNotes': instance.orderNotes,
  'deliveryDate': instance.deliveryDate,
  'timeBlock': instance.timeBlock,
  'contactPerson': instance.contactPerson,
  'fulfillmentGroupId': instance.fulfillmentGroupId,
  'assignedDistributorId': instance.assignedDistributorId,
  'assignedDistributorName': instance.assignedDistributorName,
  'revision': instance.revision,
  'status': instance.status,
  'nextStatus': instance.nextStatus,
  'statusLabel': instance.statusLabel,
  'items': instance.items,
  'itemCount': instance.itemCount,
  'quantityCount': instance.quantityCount,
  'subtotal': instance.subtotal,
  'timeline': instance.timeline,
  'fulfillmentTimeline': instance.fulfillmentTimeline,
  'history': instance.history,
  'latestStatusComment': instance.latestStatusComment,
  'actions': instance.actions,
};
