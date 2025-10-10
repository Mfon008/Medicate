import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_reminder_response_model.g.dart';

@JsonSerializable()
class GetReminderResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetReminderResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetReminderResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetReminderResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetReminderResponseModelToJson(this);
}
