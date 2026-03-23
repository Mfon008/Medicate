class PersonalInfo {
  String? fullName;
  String? dob;
  String? gender;
  String? email;
  String? phone;
  String? residentialAddress;
  String? preferredHospitalId;

  PersonalInfo({
    this.fullName,
    this.dob,
    this.gender,
    this.email,
    this.phone,
    this.residentialAddress,
    this.preferredHospitalId,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
    fullName: json['fullName'] as String?,
    dob: json['dob'] as String?,
    gender: json['gender'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    residentialAddress: json['residentialAddress'] as String?,
    preferredHospitalId: json['preferredHospitalId'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'fullName': fullName,
    'dob': dob,
    'gender': gender,
    'email': email,
    'phone': phone,
    'residentialAddress': residentialAddress,
    'preferredHospitalId': preferredHospitalId,
  };
}
