import 'package:json_annotation/json_annotation.dart';

import 'hmo_location.dart';
import 'hmo_logo.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  String? applicationId;
  String? subscriptionId;
  String? subscriberId;
  String? memberId;
  String? userId;
  String? hmoId;
  String? planId;
  String? planName;
  String? planType;
  String? planTier;
  String? status;
  String? applicationStatus;
  String? subscriptionStatus;
  String? startDate;
  String? endDate;
  double? amount;
  bool? canRenew;
  String? renewalOpensAt;
  String? rejectionReason;
  String? rejectedAt;
  String? submittedAt;
  String? paymentStatus;
  String? paymentReference;
  int? currentStep;
  String? hmoName;
  HmoLogo? hmoLogo;
  String? hmoPhone;
  HmoLocation? hmoLocation;

  Item({
    this.applicationId,
    this.subscriptionId,
    this.subscriberId,
    this.memberId,
    this.userId,
    this.hmoId,
    this.planId,
    this.planName,
    this.planType,
    this.planTier,
    this.status,
    this.applicationStatus,
    this.subscriptionStatus,
    this.startDate,
    this.endDate,
    this.amount,
    this.canRenew,
    this.renewalOpensAt,
    this.rejectionReason,
    this.rejectedAt,
    this.submittedAt,
    this.paymentStatus,
    this.paymentReference,
    this.currentStep,
    this.hmoName,
    this.hmoLogo,
    this.hmoPhone,
    this.hmoLocation,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
