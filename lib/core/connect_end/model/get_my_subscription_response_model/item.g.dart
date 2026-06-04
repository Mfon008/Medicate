// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  applicationId: json['applicationId'] as String?,
  subscriptionId: json['subscriptionId'] as String?,
  subscriberId: json['subscriberId'] as String?,
  memberId: json['memberId'] as String?,
  userId: json['userId'] as String?,
  hmoId: json['hmoId'] as String?,
  planId: json['planId'] as String?,
  planName: json['planName'] as String?,
  planType: json['planType'] as String?,
  planTier: json['planTier'] as String?,
  status: json['status'] as String?,
  applicationStatus: json['applicationStatus'] as String?,
  subscriptionStatus: json['subscriptionStatus'] as String?,
  startDate: json['startDate'] as String?,
  endDate: json['endDate'] as String?,
  amount: (json['amount'] as num?)?.toDouble(),
  canRenew: json['canRenew'] as bool?,
  renewalOpensAt: json['renewalOpensAt'] as String?,
  rejectionReason: json['rejectionReason'] as String?,
  rejectedAt: json['rejectedAt'] as String?,
  submittedAt: json['submittedAt'] as String?,
  paymentStatus: json['paymentStatus'] as String?,
  paymentReference: json['paymentReference'] as String?,
  currentStep: (json['currentStep'] as num?)?.toInt(),
  hmoName: json['hmoName'] as String?,
  hmoLogo: json['hmoLogo'] == null
      ? null
      : HmoLogo.fromJson(json['hmoLogo'] as Map<String, dynamic>),
  hmoPhone: json['hmoPhone'] as String?,
  hmoLocation: json['hmoLocation'] == null
      ? null
      : HmoLocation.fromJson(json['hmoLocation'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'applicationId': instance.applicationId,
  'subscriptionId': instance.subscriptionId,
  'subscriberId': instance.subscriberId,
  'memberId': instance.memberId,
  'userId': instance.userId,
  'hmoId': instance.hmoId,
  'planId': instance.planId,
  'planName': instance.planName,
  'planType': instance.planType,
  'planTier': instance.planTier,
  'status': instance.status,
  'applicationStatus': instance.applicationStatus,
  'subscriptionStatus': instance.subscriptionStatus,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'amount': instance.amount,
  'canRenew': instance.canRenew,
  'renewalOpensAt': instance.renewalOpensAt,
  'rejectionReason': instance.rejectionReason,
  'rejectedAt': instance.rejectedAt,
  'submittedAt': instance.submittedAt,
  'paymentStatus': instance.paymentStatus,
  'paymentReference': instance.paymentReference,
  'currentStep': instance.currentStep,
  'hmoName': instance.hmoName,
  'hmoLogo': instance.hmoLogo,
  'hmoPhone': instance.hmoPhone,
  'hmoLocation': instance.hmoLocation,
};
