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
  String? licenseNumber;
  List<String>? specialty;

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
    this.licenseNumber,
    this.specialty,
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
      licenseNumber: json['licenseNumber'] as String?,
      specialty: json['specialty'],
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
    'licenseNumber': licenseNumber,
    'specialty': specialty,
  };
}
