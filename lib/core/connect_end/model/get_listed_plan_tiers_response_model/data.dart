import 'package:json_annotation/json_annotation.dart';

import 'plan_tier.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<PlanTier>? planTiers;

  Data({this.planTiers});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
