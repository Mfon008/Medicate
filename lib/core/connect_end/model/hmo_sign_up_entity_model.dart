class HmoSignUpEntityModel {
  String? phone;
  String? hmoName;
  String? firstName;
  String? lastName;
  String? designation;
  String? businessEmail;

  HmoSignUpEntityModel({
    this.phone,
    this.hmoName,
    this.firstName,
    this.lastName,
    this.designation,
    this.businessEmail,
  });

  factory HmoSignUpEntityModel.fromJson(Map<String, dynamic> json) {
    return HmoSignUpEntityModel(
      phone: json['phone'] as String?,
      hmoName: json['hmoName'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      designation: json['designation'] as String?,
      businessEmail: json['businessEmail'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'phone': phone,
    'hmoName': hmoName,
    'firstName': firstName,
    'lastName': lastName,
    'designation': designation,
    'businessEmail': businessEmail,
  };
}
