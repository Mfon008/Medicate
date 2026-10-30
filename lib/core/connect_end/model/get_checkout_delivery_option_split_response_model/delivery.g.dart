// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Delivery _$DeliveryFromJson(Map<String, dynamic> json) => Delivery(
  deliveryAddressId: json['deliveryAddressId'] as String?,
  destination: json['destination'] == null
      ? null
      : Destination.fromJson(json['destination'] as Map<String, dynamic>),
  available: json['available'] as bool?,
  methods: (json['methods'] as List<dynamic>?)
      ?.map((e) => Method.fromJson(e as Map<String, dynamic>))
      .toList(),
  unavailableReasons: (json['unavailableReasons'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$DeliveryToJson(Delivery instance) => <String, dynamic>{
  'deliveryAddressId': instance.deliveryAddressId,
  'destination': instance.destination,
  'available': instance.available,
  'methods': instance.methods,
  'unavailableReasons': instance.unavailableReasons,
};
