// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level2 _$Level2FromJson(Map<String, dynamic> json) => Level2(
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

Map<String, dynamic> _$Level2ToJson(Level2 instance) => <String, dynamic>{
  'businessTypes': instance.businessTypes,
  'distributor': instance.distributor,
  'manufacturer': instance.manufacturer,
  'importer': instance.importer,
};
