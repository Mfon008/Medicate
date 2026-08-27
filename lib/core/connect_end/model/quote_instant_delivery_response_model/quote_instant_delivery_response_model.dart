import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'quote_instant_delivery_response_model.g.dart';

@JsonSerializable()
class QuoteInstantDeliveryResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  QuoteInstantDeliveryResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory QuoteInstantDeliveryResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$QuoteInstantDeliveryResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuoteInstantDeliveryResponseModelToJson(this);
  }
}
