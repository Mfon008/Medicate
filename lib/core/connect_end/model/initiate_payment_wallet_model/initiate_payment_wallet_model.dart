import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'initiate_payment_wallet_model.g.dart';

@JsonSerializable()
class InitiatePaymentWalletModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  InitiatePaymentWalletModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory InitiatePaymentWalletModel.fromJson(Map<String, dynamic> json) {
    return _$InitiatePaymentWalletModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InitiatePaymentWalletModelToJson(this);
}
