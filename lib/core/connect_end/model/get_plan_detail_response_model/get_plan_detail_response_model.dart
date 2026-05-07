import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_plan_detail_response_model.g.dart';

@JsonSerializable()
class GetPlanDetailResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetPlanDetailResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetPlanDetailResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetPlanDetailResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetPlanDetailResponseModelToJson(this);
}
