import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Datum? datum;

  Data({this.datum});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
