import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_my_subscription_response_model.g.dart';

@JsonSerializable()
class GetMySubscriptionResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetMySubscriptionResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetMySubscriptionResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetMySubscriptionResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetMySubscriptionResponseModelToJson(this);
  }
}
