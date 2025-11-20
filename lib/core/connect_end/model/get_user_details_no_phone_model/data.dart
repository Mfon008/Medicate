import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  User? user;
  String? address;
  String? country;
  String? dateOfBirth;
  String? gender;
  int? heightCm;
  String? state;
  int? weightKg;
  String? createdAt;
  String? updatedAt;

  Data({
    this.user,
    this.address,
    this.country,
    this.dateOfBirth,
    this.gender,
    this.heightCm,
    this.state,
    this.weightKg,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
