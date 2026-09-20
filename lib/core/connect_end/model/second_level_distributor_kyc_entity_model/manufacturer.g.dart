// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manufacturer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Manufacturer _$ManufacturerFromJson(Map<String, dynamic> json) => Manufacturer(
  businessDetails: json['businessDetails'] == null
      ? null
      : BusinessDetails.fromJson(
          json['businessDetails'] as Map<String, dynamic>,
        ),
  documents: json['documents'] == null
      ? null
      : Documents.fromJson(json['documents'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ManufacturerToJson(Manufacturer instance) =>
    <String, dynamic>{
      'businessDetails': instance.businessDetails,
      'documents': instance.documents,
    };
