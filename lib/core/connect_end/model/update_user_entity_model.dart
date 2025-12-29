class UpdateUserEntityModel {
  String? membershipId;
  String? fullName;
  String? email;
  String? phone;
  String? gender;
  String? address;
  String? country;
  String? state;
  String? roleId;
  String? licenseNumber;
  List<String>? specialty;

  UpdateUserEntityModel({
    this.fullName,
    this.membershipId,
    this.email,
    this.phone,
    this.gender,
    this.address,
    this.country,
    this.state,
    this.roleId,
    this.licenseNumber,
    this.specialty,
  });

  factory UpdateUserEntityModel.fromJson(Map<String, dynamic> json) {
    return UpdateUserEntityModel(
      membershipId: json['membershipId'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      roleId: json['roleId'] as String?,
      licenseNumber: json['licenseNumber'] as String?,
      specialty: json['specialty'],
    );
  }

  Map<String, dynamic> toJson() => {
    'membershipId': membershipId,
    'fullName': fullName,
    'email': email,
    'phone': phone,
    'gender': gender,
    'address': address,
    'country': country,
    'state': state,
    'roleId': roleId,
    'licenseNumber': licenseNumber,
    'specialty': specialty,
  };
}
