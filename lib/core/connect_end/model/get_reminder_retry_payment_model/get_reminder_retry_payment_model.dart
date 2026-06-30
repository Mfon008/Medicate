import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_reminder_retry_payment_model.g.dart';

@JsonSerializable()
class GetReminderRetryPaymentModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetReminderRetryPaymentModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetReminderRetryPaymentModel.fromJson(Map<String, dynamic> json) {
    return _$GetReminderRetryPaymentModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetReminderRetryPaymentModelToJson(this);
}
