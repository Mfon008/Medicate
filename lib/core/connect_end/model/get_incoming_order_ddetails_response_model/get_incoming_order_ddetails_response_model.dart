import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_incoming_order_ddetails_response_model.g.dart';

@JsonSerializable()
class GetIncomingOrderDdetailsResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetIncomingOrderDdetailsResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetIncomingOrderDdetailsResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetIncomingOrderDdetailsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetIncomingOrderDdetailsResponseModelToJson(this);
  }
}
