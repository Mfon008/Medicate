import 'package:json_annotation/json_annotation.dart';

import 'nafdac.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Nafdac? nafdac;

  Data({this.nafdac});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
