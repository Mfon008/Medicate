import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'pharmacy_login_response_model.g.dart';

@JsonSerializable()
class PharmacyLoginResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  PharmacyLoginResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory PharmacyLoginResponseModel.fromJson(Map<String, dynamic> json) {
    return _$PharmacyLoginResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PharmacyLoginResponseModelToJson(this);
}
