// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
  tenantId: json['tenantId'] as String?,
  name: json['name'] as String?,
  tenantType: json['tenantType'] as String?,
  address: json['address'] as String?,
  displayId: json['displayId'] as String?,
  registrationNumber: json['registrationNumber'] as String?,
  contactPersonName: json['contactPersonName'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  state: json['state'] as String?,
  lga: json['lga'] as String?,
  recipientName: json['recipientName'] as String?,
  recipientIdType: json['recipientIdType'] as String?,
);

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
  'tenantId': instance.tenantId,
  'name': instance.name,
  'tenantType': instance.tenantType,
  'address': instance.address,
  'displayId': instance.displayId,
  'registrationNumber': instance.registrationNumber,
  'contactPersonName': instance.contactPersonName,
  'phoneNumber': instance.phoneNumber,
  'state': instance.state,
  'lga': instance.lga,
  'recipientName': instance.recipientName,
  'recipientIdType': instance.recipientIdType,
};
