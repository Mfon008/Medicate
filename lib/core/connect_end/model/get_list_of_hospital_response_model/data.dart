import 'package:json_annotation/json_annotation.dart';

import 'hospital.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Hospital>? hospitals;
  int? total;
  int? page;
  int? totalPages;

  Data({this.hospitals, this.total, this.page, this.totalPages});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
