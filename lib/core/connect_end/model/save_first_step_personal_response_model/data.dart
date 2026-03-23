import 'package:json_annotation/json_annotation.dart';

import 'personal_info.dart';
import 'rejection_info.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? id;
  String? userId;
  String? hmoId;
  String? planId;
  String? planType;
  String? status;
  int? currentStep;
  String? paymentReference;
  int? totalAmount;
  PersonalInfo? personalInfo;
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

  Data({
    this.id,
    this.userId,
    this.hmoId,
    this.planId,
    this.planType,
    this.status,
    this.currentStep,
    this.paymentReference,
    this.totalAmount,
    this.personalInfo,
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
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
