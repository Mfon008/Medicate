// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KycLevel _$KycLevelFromJson(Map<String, dynamic> json) => KycLevel(
  level: (json['level'] as num?)?.toInt(),
  status: json['status'] as String?,
  submittedAt: json['submittedAt'] == null
      ? null
      : DateTime.parse(json['submittedAt'] as String),
  reviewedAt: json['reviewedAt'] == null
      ? null
      : DateTime.parse(json['reviewedAt'] as String),
  reviewedBy: json['reviewedBy'] as String?,
  approvalStatus: json['approvalStatus'] as String?,
);

Map<String, dynamic> _$KycLevelToJson(KycLevel instance) => <String, dynamic>{
  'level': instance.level,
  'status': instance.status,
  'submittedAt': instance.submittedAt?.toIso8601String(),
  'reviewedAt': instance.reviewedAt?.toIso8601String(),
  'reviewedBy': instance.reviewedBy,
  'approvalStatus': instance.approvalStatus,
};
