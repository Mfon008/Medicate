class SetPinEntityModel {
  String? pin;

  SetPinEntityModel({this.pin});

  factory SetPinEntityModel.fromJson(Map<String, dynamic> json) {
    return SetPinEntityModel(pin: json['pin'] as String?);
  }

  Map<String, dynamic> toJson() => {'pin': pin};
}
