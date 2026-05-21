import 'package:json_annotation/json_annotation.dart';

part 'hmo.g.dart';

@JsonSerializable()
class Hmo {
  String? hmoId;
  String? name;

  Hmo({this.hmoId, this.name});

  factory Hmo.fromJson(Map<String, dynamic> json) => _$HmoFromJson(json);

  Map<String, dynamic> toJson() => _$HmoToJson(this);
}
