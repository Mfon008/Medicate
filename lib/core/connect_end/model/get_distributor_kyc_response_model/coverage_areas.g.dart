// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coverage_areas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoverageAreas _$CoverageAreasFromJson(Map<String, dynamic> json) =>
    CoverageAreas(
      state: json['state'] as String?,
      lgas: (json['lgas'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CoverageAreasToJson(CoverageAreas instance) =>
    <String, dynamic>{'state': instance.state, 'lgas': instance.lgas};
