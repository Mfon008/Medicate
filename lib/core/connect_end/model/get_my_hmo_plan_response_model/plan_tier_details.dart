import 'package:json_annotation/json_annotation.dart';

part 'plan_tier_details.g.dart';

@JsonSerializable()
class PlanTierDetails {
  String? name;
  String? primaryColor;
  String? secondaryColor;
  List<String>? features;

  PlanTierDetails({
    this.name,
    this.primaryColor,
    this.secondaryColor,
    this.features,
  });

  factory PlanTierDetails.fromJson(Map<String, dynamic> json) {
    return _$PlanTierDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlanTierDetailsToJson(this);
}
