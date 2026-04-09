// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Summary _$SummaryFromJson(Map<String, dynamic> json) => Summary(
  activeCount: (json['activeCount'] as num?)?.toInt(),
  reviewPendingCount: (json['reviewPendingCount'] as num?)?.toInt(),
  draftCount: (json['draftCount'] as num?)?.toInt(),
  rejectedCount: (json['rejectedCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
  'activeCount': instance.activeCount,
  'reviewPendingCount': instance.reviewPendingCount,
  'draftCount': instance.draftCount,
  'rejectedCount': instance.rejectedCount,
};
