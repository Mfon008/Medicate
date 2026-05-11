import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_hmo_dashboard_count_response_model.g.dart';

@JsonSerializable()
class GetHmoDashboardCountResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetHmoDashboardCountResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetHmoDashboardCountResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetHmoDashboardCountResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetHmoDashboardCountResponseModelToJson(this);
  }
}
