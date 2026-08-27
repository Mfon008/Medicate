// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryDetails _$DeliveryDetailsFromJson(Map<String, dynamic> json) =>
    DeliveryDetails(
      state: json['state'] as String?,
      lga: json['lga'] as String?,
      deliveryAddress: json['deliveryAddress'] as String?,
      contactPhone: json['contactPhone'] as String?,
      orderNotes: json['orderNotes'] as String?,
    );

Map<String, dynamic> _$DeliveryDetailsToJson(DeliveryDetails instance) =>
    <String, dynamic>{
      'state': instance.state,
      'lga': instance.lga,
      'deliveryAddress': instance.deliveryAddress,
      'contactPhone': instance.contactPhone,
      'orderNotes': instance.orderNotes,
    };
