import 'package:json_annotation/json_annotation.dart';

import 'benefits_snippet.dart';
import 'plan_tier_details.dart';

part 'plan.g.dart';

@JsonSerializable()
class Plan {
  String? id;
  String? planName;
  String? planTier;
  PlanTierDetails? planTierDetails;
  String? planType;
  String? description;
  int? price;
  int? renewalPrice;
  double? displayPrice;
  int? renewalDisplayPrice;
  int? duration;
  List<BenefitsSnippet>? benefitsSnippet;
  int? hospitalCount;

  Plan({
    this.id,
    this.planName,
    this.planTier,
    this.planTierDetails,
    this.planType,
    this.description,
    this.price,
    this.renewalPrice,
    this.displayPrice,
    this.renewalDisplayPrice,
    this.duration,
    this.benefitsSnippet,
    this.hospitalCount,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);
}
