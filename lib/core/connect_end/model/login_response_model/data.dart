import 'package:json_annotation/json_annotation.dart';

import 'phone.dart';
import 'profile.dart';
import 'tokens.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: '_id')
  String? id;
  String? userType;
  Phone? phone;
  String? displayName;
  bool? pinSet;
  Profile? profile;
  String? profileType;
  DateTime? createdAt;
  DateTime? updatedAt;
  Tokens? tokens;

  Data({
    this.id,
    this.userType,
    this.phone,
    this.displayName,
    this.pinSet,
    this.profile,
    this.profileType,
    this.createdAt,
    this.updatedAt,
    this.tokens,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
