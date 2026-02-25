import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_transaction_wallet_response_model.g.dart';

@JsonSerializable()
class GetTransactionWalletResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetTransactionWalletResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetTransactionWalletResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetTransactionWalletResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetTransactionWalletResponseModelToJson(this);
  }
}
