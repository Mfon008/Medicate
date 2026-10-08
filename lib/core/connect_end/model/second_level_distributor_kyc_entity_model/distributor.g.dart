// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distributor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Distributor _$DistributorFromJson(Map<String, dynamic> json) => Distributor(
  businessDetails: json['businessDetails'] == null
      ? null
      : BusinessDetails.fromJson(
          json['businessDetails'] as Map<String, dynamic>,
        ),
  documents: json['documents'] == null
      ? null
      : Documents.fromJson(json['documents'] as Map<String, dynamic>),
  coverageAreas: (json['coverageAreas'] as List<dynamic>?)
      ?.map((e) => CoverageAreas.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DistributorToJson(Distributor instance) =>
    <String, dynamic>{
      'businessDetails': instance.businessDetails,
      'documents': instance.documents,
      'coverageAreas': instance.coverageAreas,
    };
