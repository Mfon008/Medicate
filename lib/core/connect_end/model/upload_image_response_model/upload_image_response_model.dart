import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'upload_image_response_model.g.dart';

@JsonSerializable()
class UploadImageResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  UploadImageResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory UploadImageResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UploadImageResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UploadImageResponseModelToJson(this);
}
