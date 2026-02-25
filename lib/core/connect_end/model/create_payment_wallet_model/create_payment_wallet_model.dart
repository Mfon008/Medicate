import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'create_payment_wallet_model.g.dart';

@JsonSerializable()
class CreatePaymentWalletModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  CreatePaymentWalletModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory CreatePaymentWalletModel.fromJson(Map<String, dynamic> json) {
    return _$CreatePaymentWalletModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreatePaymentWalletModelToJson(this);
}
