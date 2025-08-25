import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'verify_pass_otp_respnse_model.g.dart';

@JsonSerializable()
class VerifyPassOtpRespnseModel {
  bool? success;
  String? message;
  int? statusCode;
  Data? data;

  VerifyPassOtpRespnseModel({
    this.success,
    this.message,
    this.statusCode,
    this.data,
  });

  factory VerifyPassOtpRespnseModel.fromJson(Map<String, dynamic> json) {
    return _$VerifyPassOtpRespnseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VerifyPassOtpRespnseModelToJson(this);
}
