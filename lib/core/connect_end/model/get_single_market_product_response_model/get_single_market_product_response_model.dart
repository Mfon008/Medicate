import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_single_market_product_response_model.g.dart';

@JsonSerializable()
class GetSingleMarketProductResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetSingleMarketProductResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetSingleMarketProductResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetSingleMarketProductResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetSingleMarketProductResponseModelToJson(this);
  }
}
