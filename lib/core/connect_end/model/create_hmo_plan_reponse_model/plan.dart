import 'package:json_annotation/json_annotation.dart';

import 'benefit.dart';
import 'hospital_network.dart';

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
  });

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);
}
