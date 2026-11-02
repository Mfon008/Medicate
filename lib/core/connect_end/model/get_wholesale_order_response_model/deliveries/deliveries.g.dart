// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliveries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Deliveries _$DeliveriesFromJson(Map<String, dynamic> json) => Deliveries(
  deliveryAddressId: json['deliveryAddressId'] as String?,
  deliveryAddress: json['deliveryAddress'] as String?,
  country: json['country'] as String?,
  state: json['state'] as String?,
  lga: json['lga'] as String?,
  stateCode: json['stateCode'] as String?,
  lgaCode: json['lgaCode'] as String?,
  recipientName: json['recipientName'] as String?,
  contactPhone: json['contactPhone'] as String?,
  recipientIdType: json['recipientIdType'] as String?,
  orderNotes: json['orderNotes'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  subtotal: (json['subtotal'] as num?)?.toDouble(),
  deliveryFee: (json['deliveryFee'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toDouble(),
  deliveryBreakdown: (json['deliveryBreakdown'] as List<dynamic>?)
      ?.map((e) => DeliveryBreakdown.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DeliveriesToJson(Deliveries instance) =>
    <String, dynamic>{
      'deliveryAddressId': instance.deliveryAddressId,
      'deliveryAddress': instance.deliveryAddress,
      'country': instance.country,
      'state': instance.state,
      'lga': instance.lga,
      'stateCode': instance.stateCode,
      'lgaCode': instance.lgaCode,
      'recipientName': instance.recipientName,
      'contactPhone': instance.contactPhone,
      'recipientIdType': instance.recipientIdType,
      'orderNotes': instance.orderNotes,
      'items': instance.items,
      'subtotal': instance.subtotal,
      'deliveryFee': instance.deliveryFee,
      'total': instance.total,
      'deliveryBreakdown': instance.deliveryBreakdown,
    };
