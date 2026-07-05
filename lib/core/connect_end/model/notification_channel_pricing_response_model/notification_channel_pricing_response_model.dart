import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'notification_channel_pricing_response_model.g.dart';

@JsonSerializable()
class NotificationChannelPricingResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  NotificationChannelPricingResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory NotificationChannelPricingResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$NotificationChannelPricingResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NotificationChannelPricingResponseModelToJson(this);
  }
}
