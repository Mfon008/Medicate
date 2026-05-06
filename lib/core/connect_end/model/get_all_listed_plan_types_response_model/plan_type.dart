import 'package:json_annotation/json_annotation.dart';

part 'plan_type.g.dart';

@JsonSerializable()
class PlanType {
  String? id;
  String? name;
  String? category;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  PlanType({
    this.id,
    this.name,
    this.category,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory PlanType.fromJson(Map<String, dynamic> json) {
    return _$PlanTypeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlanTypeToJson(this);
}
