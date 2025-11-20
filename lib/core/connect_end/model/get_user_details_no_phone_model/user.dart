import 'package:json_annotation/json_annotation.dart';

import 'phone.dart';
import 'profile_picture.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? fullName;
  Phone? phone;
  String? email;
  ProfilePicture? profilePicture;
  bool? pinSet;

  User({
    this.fullName,
    this.phone,
    this.email,
    this.profilePicture,
    this.pinSet,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
