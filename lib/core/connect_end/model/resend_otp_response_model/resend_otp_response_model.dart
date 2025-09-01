import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'resend_otp_response_model.g.dart';

@JsonSerializable()
class ResendOtpResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  ResendOtpResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory ResendOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ResendOtpResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResendOtpResponseModelToJson(this);
}
