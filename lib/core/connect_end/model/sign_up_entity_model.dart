class SignUpEntityModel {
  String? fullName;
  String? phone;

  SignUpEntityModel({this.fullName, this.phone});

  factory SignUpEntityModel.fromJson(Map<String, dynamic> json) {
    return SignUpEntityModel(
      fullName: json['fullName'] as String?,
      phone: json['phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'fullName': fullName, 'phone': phone};
}
