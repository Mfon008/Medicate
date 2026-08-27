import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'wholesale_order_list_response_model.g.dart';

@JsonSerializable()
class WholesaleOrderListResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  WholesaleOrderListResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory WholesaleOrderListResponseModel.fromJson(Map<String, dynamic> json) {
    return _$WholesaleOrderListResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WholesaleOrderListResponseModelToJson(this);
  }
}
