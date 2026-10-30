import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'quote_schedule_split_delivery_response_model.g.dart';

@JsonSerializable()
class QuoteScheduleSplitDeliveryResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  QuoteScheduleSplitDeliveryResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory QuoteScheduleSplitDeliveryResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$QuoteScheduleSplitDeliveryResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuoteScheduleSplitDeliveryResponseModelToJson(this);
  }
}
