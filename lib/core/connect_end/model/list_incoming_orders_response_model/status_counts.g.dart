// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_counts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusCounts _$StatusCountsFromJson(Map<String, dynamic> json) => StatusCounts(
  confirmed: (json['CONFIRMED'] as num?)?.toInt(),
  pending: (json['PENDING'] as num?)?.toInt(),
);

Map<String, dynamic> _$StatusCountsToJson(StatusCounts instance) =>
    <String, dynamic>{
      'CONFIRMED': instance.confirmed,
      'PENDING': instance.pending,
    };
