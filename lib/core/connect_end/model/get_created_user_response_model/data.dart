import 'package:json_annotation/json_annotation.dart';

import 'staff.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Staff>? staff;

  Data({this.staff});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
