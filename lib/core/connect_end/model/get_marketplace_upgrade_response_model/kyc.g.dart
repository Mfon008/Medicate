// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kyc _$KycFromJson(Map<String, dynamic> json) => Kyc(
  businessTypes: (json['businessTypes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  distributor: json['distributor'] == null
      ? null
      : Distributor.fromJson(json['distributor'] as Map<String, dynamic>),
  manufacturer: json['manufacturer'] == null
      ? null
      : Manufacturer.fromJson(json['manufacturer'] as Map<String, dynamic>),
  importer: json['importer'] == null
      ? null
      : Importer.fromJson(json['importer'] as Map<String, dynamic>),
);

Map<String, dynamic> _$KycToJson(Kyc instance) => <String, dynamic>{
  'businessTypes': instance.businessTypes,
  'distributor': instance.distributor,
  'manufacturer': instance.manufacturer,
  'importer': instance.importer,
};
