import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'verify_pharmacy_otp_model.g.dart';

@JsonSerializable()
class VerifyPharmacyOtpModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  VerifyPharmacyOtpModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory VerifyPharmacyOtpModel.fromJson(Map<String, dynamic> json) {
    return _$VerifyPharmacyOtpModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VerifyPharmacyOtpModelToJson(this);
}
