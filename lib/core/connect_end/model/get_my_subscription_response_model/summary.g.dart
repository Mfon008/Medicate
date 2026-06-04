// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Summary _$SummaryFromJson(Map<String, dynamic> json) => Summary(
  all: (json['all'] as num?)?.toInt(),
  active: (json['active'] as num?)?.toInt(),
  expiringSoon: (json['expiringSoon'] as num?)?.toInt(),
  expired: (json['expired'] as num?)?.toInt(),
  underReview: (json['underReview'] as num?)?.toInt(),
  draft: (json['draft'] as num?)?.toInt(),
  rejected: (json['rejected'] as num?)?.toInt(),
);

Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
  'all': instance.all,
  'active': instance.active,
  'expiringSoon': instance.expiringSoon,
  'expired': instance.expired,
  'underReview': instance.underReview,
  'draft': instance.draft,
  'rejected': instance.rejected,
};
