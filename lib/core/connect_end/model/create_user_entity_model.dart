class CreateUserEntityModel {
  String? fullName;
  String? email;
  String? phone;
  String? gender;
  String? address;
  String? country;
  String? state;
  String? pin;
  String? roleId;

  CreateUserEntityModel({
    this.fullName,
    this.email,
    this.phone,
    this.gender,
    this.address,
    this.country,
    this.state,
    this.pin,
    this.roleId,
  });

  factory CreateUserEntityModel.fromJson(Map<String, dynamic> json) {
    return CreateUserEntityModel(
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      pin: json['pin'] as String?,
      roleId: json['roleId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'fullName': fullName,
    'email': email,
    'phone': phone,
    'gender': gender,
    'address': address,
    'country': country,
    'state': state,
    'pin': pin,
    'roleId': roleId,
  };
}
