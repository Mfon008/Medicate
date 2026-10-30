import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'quote_instant_split_delivery_response_model.g.dart';

@JsonSerializable()
class QuoteInstantSplitDeliveryResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  QuoteInstantSplitDeliveryResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory QuoteInstantSplitDeliveryResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$QuoteInstantSplitDeliveryResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuoteInstantSplitDeliveryResponseModelToJson(this);
  }
}
