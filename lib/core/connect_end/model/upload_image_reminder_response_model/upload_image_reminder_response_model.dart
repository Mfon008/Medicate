import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'upload_image_reminder_response_model.g.dart';

@JsonSerializable()
class UploadImageReminderResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  UploadImageReminderResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory UploadImageReminderResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UploadImageReminderResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UploadImageReminderResponseModelToJson(this);
  }
}
