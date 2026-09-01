import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_checkout_delivery_option_response_model.g.dart';

@JsonSerializable()
class GetCheckoutDeliveryOptionResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetCheckoutDeliveryOptionResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetCheckoutDeliveryOptionResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetCheckoutDeliveryOptionResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetCheckoutDeliveryOptionResponseModelToJson(this);
  }
}
