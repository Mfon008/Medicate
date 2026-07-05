import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'retry_payment_reminder_response_model.g.dart';

@JsonSerializable()
class RetryPaymentReminderResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Datum? datum;

  RetryPaymentReminderResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.datum,
  });

  factory RetryPaymentReminderResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$RetryPaymentReminderResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RetryPaymentReminderResponseModelToJson(this);
  }
}
