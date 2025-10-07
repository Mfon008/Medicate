import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'verify_otp_response_model.g.dart';

@JsonSerializable()
class VerifyOtpResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  VerifyOtpResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return _$VerifyOtpResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VerifyOtpResponseModelToJson(this);
}
