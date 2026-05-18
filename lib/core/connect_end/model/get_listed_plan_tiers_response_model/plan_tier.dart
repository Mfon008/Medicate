import 'package:json_annotation/json_annotation.dart';

part 'plan_tier.g.dart';

@JsonSerializable()
class PlanTier {
  String? id;
  String? name;
  String? hmoId;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? primaryColor;
  String? secondaryColor;
  List<String>? features;

  PlanTier({
    this.id,
    this.name,
    this.hmoId,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.primaryColor,
    this.secondaryColor,
    this.features,
  });

  factory PlanTier.fromJson(Map<String, dynamic> json) {
    return _$PlanTierFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlanTierToJson(this);
}
