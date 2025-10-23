import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'initiate_payment_response_model.g.dart';

@JsonSerializable()
class InitiatePaymentResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  InitiatePaymentResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory InitiatePaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return _$InitiatePaymentResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InitiatePaymentResponseModelToJson(this);
}
