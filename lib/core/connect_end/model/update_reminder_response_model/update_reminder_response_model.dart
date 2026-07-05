import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'update_reminder_response_model.g.dart';

@JsonSerializable()
class UpdateReminderResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  UpdateReminderResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory UpdateReminderResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UpdateReminderResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateReminderResponseModelToJson(this);
}
