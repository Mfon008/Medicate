import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_all_notification_response_model.g.dart';

@JsonSerializable()
class GetAllNotificationResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetAllNotificationResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetAllNotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllNotificationResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetAllNotificationResponseModelToJson(this);
  }
}
