import 'package:json_annotation/json_annotation.dart';

part 'level1.g.dart';

@JsonSerializable()
class Level1 {
  String? phoneNumber;
  String? hmoName;
  String? businessAddress;
  String? businessEmail;
  String? contactPersonFirstName;
  String? contactPersonLastName;
  String? contactPersonDesignation;

  Level1({
    this.phoneNumber,
    this.hmoName,
    this.businessAddress,
    this.businessEmail,
    this.contactPersonFirstName,
    this.contactPersonLastName,
    this.contactPersonDesignation,
  });

  factory Level1.fromJson(Map<String, dynamic> json) {
    return _$Level1FromJson(json);
  }

  Map<String, dynamic> toJson() => _$Level1ToJson(this);
}
