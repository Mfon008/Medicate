import 'package:json_annotation/json_annotation.dart';

part 'dependent.g.dart';

@JsonSerializable()
class Dependent {
  String? fullName;
  String? relationship;
  DateTime? dob;
  String? gender;

  Dependent({this.fullName, this.relationship, this.dob, this.gender});

  factory Dependent.fromJson(Map<String, dynamic> json) {
    return _$DependentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DependentToJson(this);
}
