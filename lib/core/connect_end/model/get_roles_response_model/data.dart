import 'package:json_annotation/json_annotation.dart';

import 'role.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Role>? roles;

  Data({this.roles});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
