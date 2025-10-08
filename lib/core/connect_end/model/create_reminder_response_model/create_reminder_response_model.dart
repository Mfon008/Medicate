import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'create_reminder_response_model.g.dart';

@JsonSerializable()
class CreateReminderResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  CreateReminderResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory CreateReminderResponseModel.fromJson(Map<String, dynamic> json) {
    return _$CreateReminderResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateReminderResponseModelToJson(this);
}
