// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
  tenantId: json['tenantId'] as String?,
  name: json['name'] as String?,
  address: json['address'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  state: json['state'] as String?,
  lga: json['lga'] as String?,
);

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
  'tenantId': instance.tenantId,
  'name': instance.name,
  'address': instance.address,
  'phoneNumber': instance.phoneNumber,
  'state': instance.state,
  'lga': instance.lga,
};
