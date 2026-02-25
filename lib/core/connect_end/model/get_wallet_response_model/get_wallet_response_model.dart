import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_wallet_response_model.g.dart';

@JsonSerializable()
class GetWalletResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetWalletResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetWalletResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetWalletResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetWalletResponseModelToJson(this);
}
