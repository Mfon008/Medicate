// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Delivery _$DeliveryFromJson(Map<String, dynamic> json) => Delivery(
  deliveryAddressId: json['deliveryAddressId'] as String?,
  recipientName: json['recipientName'] as String?,
  recipientIdType: json['recipientIdType'] as String?,
  contactPhone: json['contactPhone'] as String?,
  orderNotes: json['orderNotes'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DeliveryToJson(Delivery instance) => <String, dynamic>{
  'deliveryAddressId': instance.deliveryAddressId,
  'recipientName': instance.recipientName,
  'recipientIdType': instance.recipientIdType,
  'contactPhone': instance.contactPhone,
  'orderNotes': instance.orderNotes,
  'items': instance.items,
};
