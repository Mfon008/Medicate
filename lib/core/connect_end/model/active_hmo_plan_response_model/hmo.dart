import 'package:json_annotation/json_annotation.dart';

import 'location.dart';
import 'logo.dart';

part 'hmo.g.dart';

@JsonSerializable()
class Hmo {
  String? hmoId;
  String? name;
  Location? location;
  String? phone;
  Logo? logo;
  int? planCount;

  Hmo({
    this.hmoId,
    this.name,
    this.location,
    this.phone,
    this.logo,
    this.planCount,
  });

  factory Hmo.fromJson(Map<String, dynamic> json) => _$HmoFromJson(json);

  Map<String, dynamic> toJson() => _$HmoToJson(this);
}
