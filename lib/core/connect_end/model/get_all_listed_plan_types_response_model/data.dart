import 'package:json_annotation/json_annotation.dart';

import 'plan_type.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<PlanType>? planTypes;

  Data({this.planTypes});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
