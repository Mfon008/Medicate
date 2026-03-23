// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  id: json['id'] as String?,
  userId: json['userId'] as String?,
  hmoId: json['hmoId'] as String?,
  planId: json['planId'] as String?,
  planType: json['planType'] as String?,
  status: json['status'] as String?,
  currentStep: (json['currentStep'] as num?)?.toInt(),
  paymentReference: json['paymentReference'] as String?,
  totalAmount: (json['totalAmount'] as num?)?.toInt(),
  personalInfo: json['personalInfo'] == null
      ? null
      : PersonalInfo.fromJson(json['personalInfo'] as Map<String, dynamic>),
  planSpecific: json['planSpecific'] == null
      ? null
      : PlanSpecific.fromJson(json['planSpecific'] as Map<String, dynamic>),
  activationDate: json['activationDate'] as String?,
  startDate: json['startDate'] as String?,
  endDate: json['endDate'] as String?,
  memberId: json['memberId'] as String?,
  rejectionInfo: json['rejectionInfo'] == null
      ? null
      : RejectionInfo.fromJson(json['rejectionInfo'] as Map<String, dynamic>),
  derivedStatus: json['derivedStatus'] as String?,
  durationMonths: (json['durationMonths'] as num?)?.toInt(),
  previousApplicationId: json['previousApplicationId'] as String?,
  submittedAt: json['submittedAt'] as String?,
  planTier: json['planTier'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'hmoId': instance.hmoId,
  'planId': instance.planId,
  'planType': instance.planType,
  'status': instance.status,
  'currentStep': instance.currentStep,
  'paymentReference': instance.paymentReference,
  'totalAmount': instance.totalAmount,
  'personalInfo': instance.personalInfo,
  'planSpecific': instance.planSpecific,
  'activationDate': instance.activationDate,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'memberId': instance.memberId,
  'rejectionInfo': instance.rejectionInfo,
  'derivedStatus': instance.derivedStatus,
  'durationMonths': instance.durationMonths,
  'previousApplicationId': instance.previousApplicationId,
  'submittedAt': instance.submittedAt,
  'planTier': instance.planTier,
};
