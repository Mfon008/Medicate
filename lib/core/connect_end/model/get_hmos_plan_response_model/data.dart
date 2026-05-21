import 'package:json_annotation/json_annotation.dart';

import 'hmo.dart';
import 'meta.dart';
import 'plan.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Hmo? hmo;
  List<Plan>? plans;
  Meta? meta;

  Data({this.hmo, this.plans, this.meta});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
