import 'package:json_annotation/json_annotation.dart';

import 'plan.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Plan>? plans;

  Data({this.plans});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
