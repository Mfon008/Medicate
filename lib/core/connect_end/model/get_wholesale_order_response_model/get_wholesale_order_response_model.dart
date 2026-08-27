import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_wholesale_order_response_model.g.dart';

@JsonSerializable()
class GetWholesaleOrderResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetWholesaleOrderResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetWholesaleOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetWholesaleOrderResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetWholesaleOrderResponseModelToJson(this);
  }
}
