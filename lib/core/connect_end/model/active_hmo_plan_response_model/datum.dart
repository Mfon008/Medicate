import 'package:json_annotation/json_annotation.dart';

import 'logo.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  String? id;
  String? name;
  Logo? logo;
  String? businessAddress;
  String? phone;
  int? planCount;

  Datum({
    this.id,
    this.name,
    this.logo,
    this.businessAddress,
    this.phone,
    this.planCount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
