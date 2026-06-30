import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_reminder_draft_response_model.g.dart';

@JsonSerializable()
class GetReminderDraftResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetReminderDraftResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetReminderDraftResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetReminderDraftResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetReminderDraftResponseModelToJson(this);
}
