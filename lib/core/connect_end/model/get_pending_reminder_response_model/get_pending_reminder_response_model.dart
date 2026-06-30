import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_pending_reminder_response_model.g.dart';

@JsonSerializable()
class GetPendingReminderResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetPendingReminderResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetPendingReminderResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetPendingReminderResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetPendingReminderResponseModelToJson(this);
  }
}
