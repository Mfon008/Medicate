import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'place_order_wallet_response_model.g.dart';

@JsonSerializable()
class PlaceOrderWalletResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  PlaceOrderWalletResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory PlaceOrderWalletResponseModel.fromJson(Map<String, dynamic> json) {
    return _$PlaceOrderWalletResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlaceOrderWalletResponseModelToJson(this);
}
