import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'quote_schedule_delivery_response_model.g.dart';

@JsonSerializable()
class QuoteScheduleDeliveryResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  QuoteScheduleDeliveryResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory QuoteScheduleDeliveryResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$QuoteScheduleDeliveryResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuoteScheduleDeliveryResponseModelToJson(this);
  }
}
