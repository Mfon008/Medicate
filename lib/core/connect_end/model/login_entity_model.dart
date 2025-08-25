class LoginEntityModel {
  String? phone;
  String? pin;

  LoginEntityModel({this.phone, this.pin});

  factory LoginEntityModel.fromJson(Map<String, dynamic> json) {
    return LoginEntityModel(
      phone: json['phone'] as String?,
      pin: json['pin'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'phone': phone, 'pin': pin};
}
