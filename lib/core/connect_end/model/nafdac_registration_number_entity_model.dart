class NafdacRegistrationNumberEntityModel {
  String? registrationNumber;

  NafdacRegistrationNumberEntityModel({this.registrationNumber});

  factory NafdacRegistrationNumberEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return NafdacRegistrationNumberEntityModel(
      registrationNumber: json['registrationNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'registrationNumber': registrationNumber};
}
