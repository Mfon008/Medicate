import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'hmo_plan_payment_response_model.g.dart';

@JsonSerializable()
class HmoPlanPaymentResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  HmoPlanPaymentResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory HmoPlanPaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return _$HmoPlanPaymentResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HmoPlanPaymentResponseModelToJson(this);
}
