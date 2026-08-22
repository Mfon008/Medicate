import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'wholesale_get_product_added_to_cart_response_model.g.dart';

@JsonSerializable()
class WholesaleGetProductAddedToCartResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  WholesaleGetProductAddedToCartResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory WholesaleGetProductAddedToCartResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$WholesaleGetProductAddedToCartResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WholesaleGetProductAddedToCartResponseModelToJson(this);
  }
}
