// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryDetails _$DeliveryDetailsFromJson(Map<String, dynamic> json) =>
    DeliveryDetails(
      recipientName: json['recipientName'] as String?,
      recipientIdType: json['recipientIdType'] as String?,
      tenantId: json['tenantId'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      state: json['state'] as String?,
      lga: json['lga'] as String?,
    );

Map<String, dynamic> _$DeliveryDetailsToJson(DeliveryDetails instance) =>
    <String, dynamic>{
      'recipientName': instance.recipientName,
      'recipientIdType': instance.recipientIdType,
      'tenantId': instance.tenantId,
      'name': instance.name,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'state': instance.state,
      'lga': instance.lga,
    };
