import 'package:json_annotation/json_annotation.dart';

import 'hmo.dart';
import 'meta.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Hmo>? hmos;
  Meta? meta;

  Data({this.hmos, this.meta});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
