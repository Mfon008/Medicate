import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'forgot_password_response_model.g.dart';

@JsonSerializable()
class ForgotPasswordResponseModel {
  bool? success;
  String? message;
  int? statusCode;
  Data? data;

  ForgotPasswordResponseModel({
    this.success,
    this.message,
    this.statusCode,
    this.data,
  });

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ForgotPasswordResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ForgotPasswordResponseModelToJson(this);
}
