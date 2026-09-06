import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'list_incoming_orders_response_model.g.dart';

@JsonSerializable()
class ListIncomingOrdersResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  ListIncomingOrdersResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory ListIncomingOrdersResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ListIncomingOrdersResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ListIncomingOrdersResponseModelToJson(this);
  }
}
