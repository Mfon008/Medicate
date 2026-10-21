// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coverage_area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoverageArea _$CoverageAreaFromJson(Map<String, dynamic> json) => CoverageArea(
  state: json['state'] as String?,
  lgas: (json['lgas'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$CoverageAreaToJson(CoverageArea instance) =>
    <String, dynamic>{'state': instance.state, 'lgas': instance.lgas};
