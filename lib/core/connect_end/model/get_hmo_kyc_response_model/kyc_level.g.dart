// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KycLevel _$KycLevelFromJson(Map<String, dynamic> json) => KycLevel(
  level: (json['level'] as num?)?.toInt(),
  status: json['status'] as String?,
  rejectionComment: json['rejectionComment'] as String?,
  submittedAt: json['submittedAt'],
  reviewedAt: json['reviewedAt'],
  reviewedBy: json['reviewedBy'] as String?,
);

Map<String, dynamic> _$KycLevelToJson(KycLevel instance) => <String, dynamic>{
  'level': instance.level,
  'status': instance.status,
  'rejectionComment': instance.rejectionComment,
  'submittedAt': instance.submittedAt,
  'reviewedAt': instance.reviewedAt,
  'reviewedBy': instance.reviewedBy,
};
