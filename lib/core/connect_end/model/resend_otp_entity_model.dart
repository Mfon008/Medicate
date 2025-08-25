class ResendOtpEntityModel {
  String? phone;

  ResendOtpEntityModel({this.phone});

  factory ResendOtpEntityModel.fromJson(Map<String, dynamic> json) {
    return ResendOtpEntityModel(phone: json['phone'] as String?);
  }

  Map<String, dynamic> toJson() => {'phone': phone};
}
