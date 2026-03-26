import 'package:json_annotation/json_annotation.dart';

import 'hospital.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Hospital>? hospitals;

  Data({this.hospitals});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
