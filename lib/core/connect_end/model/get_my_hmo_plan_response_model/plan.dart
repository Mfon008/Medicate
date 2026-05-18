import 'package:json_annotation/json_annotation.dart';

import 'benefit.dart';
import 'hospital_network.dart';
import 'plan_tier_details.dart';

part 'plan.g.dart';

@JsonSerializable()
class Plan {
  String? id;
  String? hmoId;
  String? planName;
  String? planType;
  String? planTier;
  String? description;
  int? price;
  int? duration;
  List<String>? hospitalNetworkIds;
  List<Benefit>? benefits;
  bool? isActive;
  List<HospitalNetwork>? hospitalNetwork;
  String? approvalStatus;
  int? superAdminCommission;
  int? renewalPrice;
  int? renewalSuperAdminCommission;
  String? planTierPrimaryColor;
  String? planTierSecondaryColor;
  List<String>? planTierFeatures;
  PlanTierDetails? planTierDetails;

  Plan({
    this.id,
    this.hmoId,
    this.planName,
    this.planType,
    this.planTier,
    this.description,
    this.price,
    this.duration,
    this.hospitalNetworkIds,
    this.benefits,
    this.isActive,
    this.hospitalNetwork,
    this.approvalStatus,
    this.superAdminCommission,
    this.renewalPrice,
    this.renewalSuperAdminCommission,
    this.planTierPrimaryColor,
    this.planTierSecondaryColor,
    this.planTierFeatures,
    this.planTierDetails,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);
}
