import 'tier.dart';

class CreatePlanTierEntityModel {
  List<Tier>? tiers;

  CreatePlanTierEntityModel({this.tiers});

  factory CreatePlanTierEntityModel.fromJson(Map<String, dynamic> json) {
    return CreatePlanTierEntityModel(
      tiers: (json['tiers'] as List<dynamic>?)
          ?.map((e) => Tier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'tiers': tiers?.map((e) => e.toJson()).toList(),
  };
}
