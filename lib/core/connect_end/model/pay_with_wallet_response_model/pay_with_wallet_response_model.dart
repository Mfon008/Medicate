import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'pay_with_wallet_response_model.g.dart';

@JsonSerializable()
class PayWithWalletResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  PayWithWalletResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory PayWithWalletResponseModel.fromJson(Map<String, dynamic> json) {
    return _$PayWithWalletResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PayWithWalletResponseModelToJson(this);
}
