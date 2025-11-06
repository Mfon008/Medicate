import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? id;
  String? fullName;
  String? email;
  String? phone;
  String? profilePictureUrl;
  int? profileCompletionPercentage;

  User({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.profilePictureUrl,
    this.profileCompletionPercentage,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
