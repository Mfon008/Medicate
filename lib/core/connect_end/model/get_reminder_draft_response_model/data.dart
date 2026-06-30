import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'meta.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Datum>? data;
  Meta? meta;

  Data({this.data, this.meta});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
