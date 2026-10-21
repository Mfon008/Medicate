// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  tenantId: json['tenantId'] as String?,
  tenantType: json['tenantType'] as String?,
  companyName: json['companyName'] as String?,
  requestId: json['requestId'] as String?,
  status: json['status'] as String?,
  eligible: json['eligible'] as bool?,
  canSellWholesale: json['canSellWholesale'] as bool?,
  originalKycApproved: json['originalKycApproved'] as bool?,
  kyc: json['kyc'] == null
      ? null
      : Kyc.fromJson(json['kyc'] as Map<String, dynamic>),
  submittedAt: json['submittedAt'] as String?,
  reviewedAt: json['reviewedAt'] as String?,
  reviewedBy: json['reviewedBy'] as String?,
  rejectionComment: json['rejectionComment'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'tenantId': instance.tenantId,
  'tenantType': instance.tenantType,
  'companyName': instance.companyName,
  'requestId': instance.requestId,
  'status': instance.status,
  'eligible': instance.eligible,
  'canSellWholesale': instance.canSellWholesale,
  'originalKycApproved': instance.originalKycApproved,
  'kyc': instance.kyc,
  'submittedAt': instance.submittedAt,
  'reviewedAt': instance.reviewedAt,
  'reviewedBy': instance.reviewedBy,
  'rejectionComment': instance.rejectionComment,
};
