// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level1 _$Level1FromJson(Map<String, dynamic> json) => Level1(
  pharmacyName: json['pharmacyName'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  licenseNumber: json['licenseNumber'] as String?,
  businessAddress: json['businessAddress'] as String?,
  email: json['email'] as String?,
  country: json['country'] as String?,
  state: json['state'] as String?,
  lga: json['lga'] as String?,
  selectedServices: (json['selectedServices'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  contactPersonName: json['contactPersonName'] as String?,
  contactEmail: json['contactEmail'] as String?,
  bankName: json['bankName'] as String?,
  accountName: json['accountName'] as String?,
  businessAddresses: (json['businessAddresses'] as List<dynamic>?)
      ?.map((e) => BusinessAddress.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$Level1ToJson(Level1 instance) => <String, dynamic>{
  'pharmacyName': instance.pharmacyName,
  'phoneNumber': instance.phoneNumber,
  'licenseNumber': instance.licenseNumber,
  'businessAddress': instance.businessAddress,
  'email': instance.email,
  'country': instance.country,
  'state': instance.state,
  'lga': instance.lga,
  'selectedServices': instance.selectedServices,
  'contactPersonName': instance.contactPersonName,
  'contactEmail': instance.contactEmail,
  'bankName': instance.bankName,
  'accountName': instance.accountName,
  'businessAddresses': instance.businessAddresses,
};
