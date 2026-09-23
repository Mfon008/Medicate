// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_addresses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessAddresses _$BusinessAddressesFromJson(Map<String, dynamic> json) =>
    BusinessAddresses(
      id: json['id'],
      businessAddress: json['businessAddress'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      lga: json['lga'] as String?,
    );

Map<String, dynamic> _$BusinessAddressesToJson(BusinessAddresses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'businessAddress': instance.businessAddress,
      'country': instance.country,
      'state': instance.state,
      'lga': instance.lga,
    };
