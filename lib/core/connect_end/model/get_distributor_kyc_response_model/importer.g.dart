// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'importer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Importer _$ImporterFromJson(Map<String, dynamic> json) => Importer(
  businessDetails: json['businessDetails'] == null
      ? null
      : BusinessDetails.fromJson(
          json['businessDetails'] as Map<String, dynamic>,
        ),
  documents: json['documents'] == null
      ? null
      : Documents.fromJson(json['documents'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ImporterToJson(Importer instance) => <String, dynamic>{
  'businessDetails': instance.businessDetails,
  'documents': instance.documents,
};
