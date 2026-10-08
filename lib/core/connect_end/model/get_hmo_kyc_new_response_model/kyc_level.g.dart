// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KycLevel _$KycLevelFromJson(Map<String, dynamic> json) => KycLevel(
  level: (json['level'] as num?)?.toInt(),
  status: json['status'] as String?,
  approvalStatus: json['approvalStatus'] as String?,
  submittedAt: json['submittedAt'],
);

Map<String, dynamic> _$KycLevelToJson(KycLevel instance) => <String, dynamic>{
  'level': instance.level,
  'status': instance.status,
  'approvalStatus': instance.approvalStatus,
  'submittedAt': instance.submittedAt,
};
