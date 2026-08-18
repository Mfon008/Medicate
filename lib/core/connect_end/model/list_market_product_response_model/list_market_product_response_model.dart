import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'list_market_product_response_model.g.dart';

@JsonSerializable()
class ListMarketProductResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  ListMarketProductResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory ListMarketProductResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ListMarketProductResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ListMarketProductResponseModelToJson(this);
  }
}
