import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_today_reminder_model.g.dart';

@JsonSerializable()
class GetTodayReminderModel {
  bool? success;
  int? statusCode;
  String? message;
  List<Datum>? data;

  GetTodayReminderModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetTodayReminderModel.fromJson(Map<String, dynamic> json) {
    return _$GetTodayReminderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetTodayReminderModelToJson(this);
}
