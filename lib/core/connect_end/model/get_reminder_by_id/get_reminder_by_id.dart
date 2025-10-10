import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_reminder_by_id.g.dart';

@JsonSerializable()
class GetReminderById {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetReminderById({this.success, this.statusCode, this.message, this.data});

  factory GetReminderById.fromJson(Map<String, dynamic> json) {
    return _$GetReminderByIdFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetReminderByIdToJson(this);
}
