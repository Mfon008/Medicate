// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level1 _$Level1FromJson(Map<String, dynamic> json) => Level1(
  healthcareFacilityName: json['healthcareFacilityName'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  registrationNumber: json['registrationNumber'] as String?,
  providerType: json['providerType'] as String?,
  country: json['country'] as String?,
  state: json['state'] as String?,
  lga: json['lga'] as String?,
  website: json['website'] as String?,
  servicesOffered: (json['servicesOffered'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  businessAddresses: (json['businessAddresses'] as List<dynamic>?)
      ?.map((e) => BusinessAddresses.fromJson(e as Map<String, dynamic>))
      .toList(),
  businessAddress: json['businessAddress'] as String?,
  businessEmail: json['businessEmail'] as String?,
);

Map<String, dynamic> _$Level1ToJson(Level1 instance) => <String, dynamic>{
  'healthcareFacilityName': instance.healthcareFacilityName,
  'phoneNumber': instance.phoneNumber,
  'registrationNumber': instance.registrationNumber,
  'providerType': instance.providerType,
  'country': instance.country,
  'state': instance.state,
  'lga': instance.lga,
  'website': instance.website,
  'servicesOffered': instance.servicesOffered,
  'businessAddress': instance.businessAddress,
  'businessAddresses': instance.businessAddresses,
  'businessEmail': instance.businessEmail,
};
