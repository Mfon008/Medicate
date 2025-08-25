class ResetPasswordEntityModel {
  String? phone;
  String? newPin;
  String? userIntent;

  ResetPasswordEntityModel({this.phone, this.newPin, this.userIntent});

  factory ResetPasswordEntityModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordEntityModel(
      phone: json['phone'] as String?,
      newPin: json['newPin'] as String?,
      userIntent: json['userIntent'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'phone': phone,
    'newPin': newPin,
    'userIntent': userIntent,
  };
}
