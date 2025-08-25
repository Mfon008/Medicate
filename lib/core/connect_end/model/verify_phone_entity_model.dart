class VerifyPhoneEntityModel {
  String? phone;
  String? otp;

  VerifyPhoneEntityModel({this.phone, this.otp});

  factory VerifyPhoneEntityModel.fromJson(Map<String, dynamic> json) {
    return VerifyPhoneEntityModel(
      phone: json['phone'] as String?,
      otp: json['otp'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'phone': phone, 'otp': otp};
}
