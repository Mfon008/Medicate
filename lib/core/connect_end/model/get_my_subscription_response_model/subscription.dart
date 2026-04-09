import 'package:json_annotation/json_annotation.dart';

import 'document.dart';
import 'personal_info.dart';
import 'plan_specific.dart';
import 'rejection_info.dart';

part 'subscription.g.dart';

@JsonSerializable()
class Subscription {
  String? id;
  String? userId;
  String? hmoId;
  String? planId;
  String? planType;
  String? status;
  int? currentStep;
  String? paymentReference;
  int? totalAmount;
  String? activationDate;
  String? startDate;
  String? endDate;
  String? memberId;
  RejectionInfo? rejectionInfo;
  String? derivedStatus;
  int? durationMonths;
  String? previousApplicationId;
  String? submittedAt;
  String? planTier;
  PersonalInfo? personalInfo;
  PlanSpecific? planSpecific;
  List<Document>? documents;

  Subscription({
    this.id,
    this.userId,
    this.hmoId,
    this.planId,
    this.planType,
    this.status,
    this.currentStep,
    this.paymentReference,
    this.totalAmount,
    this.activationDate,
    this.startDate,
    this.endDate,
    this.memberId,
    this.rejectionInfo,
    this.derivedStatus,
    this.durationMonths,
    this.previousApplicationId,
    this.submittedAt,
    this.planTier,
    this.personalInfo,
    this.planSpecific,
    this.documents,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return _$SubscriptionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);
}
