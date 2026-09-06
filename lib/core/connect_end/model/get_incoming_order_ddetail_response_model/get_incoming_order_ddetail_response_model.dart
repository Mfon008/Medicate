import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_incoming_order_ddetail_response_model.g.dart';

@JsonSerializable()
class GetIncomingOrderDdetailResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetIncomingOrderDdetailResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetIncomingOrderDdetailResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetIncomingOrderDdetailResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetIncomingOrderDdetailResponseModelToJson(this);
  }
}
