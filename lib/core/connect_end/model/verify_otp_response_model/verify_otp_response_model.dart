import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'verify_otp_response_model.g.dart';

@JsonSerializable()
class VerifyOtpResponseModel {
  bool? success;
  String? message;
  int? statusCode;
  Data? data;

  VerifyOtpResponseModel({
    this.success,
    this.message,
    this.statusCode,
    this.data,
  });

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return _$VerifyOtpResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VerifyOtpResponseModelToJson(this);
}
