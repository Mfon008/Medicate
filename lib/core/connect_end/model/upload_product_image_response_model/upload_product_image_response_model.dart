import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'upload_product_image_response_model.g.dart';

@JsonSerializable()
class UploadProductImageResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  UploadProductImageResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory UploadProductImageResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UploadProductImageResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UploadProductImageResponseModelToJson(this);
  }
}
