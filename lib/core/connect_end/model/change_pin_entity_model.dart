class ChangePinEntityModel {
  String? oldPin;
  String? newPin;

  ChangePinEntityModel({this.oldPin, this.newPin});

  factory ChangePinEntityModel.fromJson(Map<String, dynamic> json) {
    return ChangePinEntityModel(
      oldPin: json['oldPin'] as String?,
      newPin: json['newPin'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'oldPin': oldPin, 'newPin': newPin};
}
