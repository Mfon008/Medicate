import 'profile_picture.dart';

class UpdateUserProfileEntity {
  ProfilePicture? profilePicture;
  String? email;
  String? dateOfBirth;
  String? gender;
  String? country;
  // int? age;
  String? state;
  String? address;
  int? height;
  int? weight;

  UpdateUserProfileEntity({
    this.profilePicture,
    this.email,
    this.dateOfBirth,
    this.gender,
    this.country,
    // this.age,
    this.state,
    this.address,
    this.height,
    this.weight,
  });

  factory UpdateUserProfileEntity.fromJson(Map<String, dynamic> json) {
    return UpdateUserProfileEntity(
      profilePicture: json['profilePicture'] == null
          ? null
          : ProfilePicture.fromJson(
              json['profilePicture'] as Map<String, dynamic>,
            ),
      email: json['email'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: json['gender'] as String?,
      country: json['country'] as String?,
      // age: json['age'] as int?,
      state: json['state'] as String?,
      address: json['address'] as String?,
      height: json['heightCm'] as int?,
      weight: json['weightKg'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'profilePicture': profilePicture?.toJson(),
    'email': email,
    'dateOfBirth': dateOfBirth,
    'gender': gender,
    'country': country,
    // 'age': age,
    'state': state,
    'address': address,
    'heightCm': height,
    'weightKg': weight,
  };
}
