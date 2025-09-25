import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? id;
  String? fullName;
  String? email;
  String? dateOfBirth;
  String? gender;
  int? age;
  String? country;
  int? height;
  int? weight;
  int? profileCompletion;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.fullName,
    this.email,
    this.dateOfBirth,
    this.gender,
    this.age,
    this.country,
    this.height,
    this.weight,
    this.profileCompletion,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
