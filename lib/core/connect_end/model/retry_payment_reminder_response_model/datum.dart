import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  String? message;
  Data? data;

  Datum({this.message, this.data});

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
