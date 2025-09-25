class UpdateUserProfileEntity {
  String? dateOfBirth;
  String? gender;
  int? age;
  String? email;
  String? country;
  int? height;
  int? weight;

  UpdateUserProfileEntity({
    this.dateOfBirth,
    this.gender,
    this.age,
    this.email,
    this.country,
    this.height,
    this.weight,
  });

  factory UpdateUserProfileEntity.fromJson(Map<String, dynamic> json) {
    return UpdateUserProfileEntity(
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: json['gender'] as String?,
      age: json['age'] as int?,
      email: json['email'] as String?,
      country: json['country'] as String?,
      height: json['height'] as int?,
      weight: json['weight'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'dateOfBirth': dateOfBirth,
    'gender': gender,
    'age': age,
    'email': email,
    'country': country,
    'height': height,
    'weight': weight,
  };
}
