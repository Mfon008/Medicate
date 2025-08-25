import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  @JsonKey(name: '_id')
  String? id;
  String? fullName;
  dynamic email;
  dynamic dateOfBirth;
  dynamic gender;
  dynamic age;
  dynamic country;
  dynamic height;
  dynamic weight;
  dynamic profilePicture;
  int? profileCompletion;
  DateTime? createdAt;
  DateTime? updatedAt;

  Profile({
    this.id,
    this.fullName,
    this.email,
    this.dateOfBirth,
    this.gender,
    this.age,
    this.country,
    this.height,
    this.weight,
    this.profilePicture,
    this.profileCompletion,
    this.createdAt,
    this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return _$ProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
