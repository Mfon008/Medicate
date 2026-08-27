import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'place_order_accelerate_response_model.g.dart';

@JsonSerializable()
class PlaceOrderAccelerateResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  PlaceOrderAccelerateResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory PlaceOrderAccelerateResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$PlaceOrderAccelerateResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PlaceOrderAccelerateResponseModelToJson(this);
  }
}
