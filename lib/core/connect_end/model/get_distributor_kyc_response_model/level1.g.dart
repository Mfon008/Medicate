// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level1 _$Level1FromJson(Map<String, dynamic> json) => Level1(
  distributorManufacturerName: json['distributorManufacturerName'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  registrationNumber: json['registrationNumber'] as String?,
  businessAddress: json['businessAddress'] as String?,
  country: json['country'] as String?,
  state: json['state'] as String?,
  lga: json['lga'] as String?,
  businessAddresses: (json['businessAddresses'] as List<dynamic>?)
      ?.map((e) => BusinessAddresses.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$Level1ToJson(Level1 instance) => <String, dynamic>{
  'distributorManufacturerName': instance.distributorManufacturerName,
  'phoneNumber': instance.phoneNumber,
  'registrationNumber': instance.registrationNumber,
  'businessAddress': instance.businessAddress,
  'country': instance.country,
  'state': instance.state,
  'lga': instance.lga,
  'businessAddresses': instance.businessAddresses,
};
