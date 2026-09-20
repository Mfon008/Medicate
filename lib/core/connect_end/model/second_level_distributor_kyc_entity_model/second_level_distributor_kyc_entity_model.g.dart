// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'second_level_distributor_kyc_entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecondLevelDistributorKycEntityModel
_$SecondLevelDistributorKycEntityModelFromJson(Map<String, dynamic> json) =>
    SecondLevelDistributorKycEntityModel(
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

Map<String, dynamic> _$SecondLevelDistributorKycEntityModelToJson(
  SecondLevelDistributorKycEntityModel instance,
) => <String, dynamic>{
  'businessTypes': instance.businessTypes,
  'distributor': instance.distributor,
  'manufacturer': instance.manufacturer,
  'importer': instance.importer,
};
