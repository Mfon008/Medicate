import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_single_product_response_model.g.dart';

@JsonSerializable()
class GetSingleProductResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetSingleProductResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetSingleProductResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetSingleProductResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetSingleProductResponseModelToJson(this);
}
