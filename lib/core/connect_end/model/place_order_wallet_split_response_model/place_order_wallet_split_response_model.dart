import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'place_order_wallet_split_response_model.g.dart';

@JsonSerializable()
class PlaceOrderWalletSplitResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  PlaceOrderWalletSplitResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory PlaceOrderWalletSplitResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$PlaceOrderWalletSplitResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PlaceOrderWalletSplitResponseModelToJson(this);
  }
}
