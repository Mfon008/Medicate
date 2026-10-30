import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'place_order_accelerate_split_response_model.g.dart';

@JsonSerializable()
class PlaceOrderAccelerateSplitResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  PlaceOrderAccelerateSplitResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory PlaceOrderAccelerateSplitResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$PlaceOrderAccelerateSplitResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PlaceOrderAccelerateSplitResponseModelToJson(this);
  }
}
