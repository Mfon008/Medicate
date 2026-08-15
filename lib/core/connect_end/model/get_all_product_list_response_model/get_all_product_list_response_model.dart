import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_all_product_list_response_model.g.dart';

@JsonSerializable()
class GetAllProductListResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetAllProductListResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetAllProductListResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllProductListResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetAllProductListResponseModelToJson(this);
  }
}
