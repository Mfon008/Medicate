class SignUpPharmacyEntityModel {
  String? name;
  String? licenseNumber;
  String? businessAddress;
  String? email;
  String? phone;

  SignUpPharmacyEntityModel({
    this.name,
    this.licenseNumber,
    this.businessAddress,
    this.email,
    this.phone,
  });

  factory SignUpPharmacyEntityModel.fromJson(Map<String, dynamic> json) {
    return SignUpPharmacyEntityModel(
      name: json['name'] as String?,
      licenseNumber: json['licenseNumber'] as String?,
      businessAddress: json['businessAddress'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'licenseNumber': licenseNumber,
    'businessAddress': businessAddress,
    'email': email,
    'phone': phone,
  };
}
