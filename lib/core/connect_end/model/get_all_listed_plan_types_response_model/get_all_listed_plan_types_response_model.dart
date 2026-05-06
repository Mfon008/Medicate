import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_all_listed_plan_types_response_model.g.dart';

@JsonSerializable()
class GetAllListedPlanTypesResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetAllListedPlanTypesResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetAllListedPlanTypesResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetAllListedPlanTypesResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetAllListedPlanTypesResponseModelToJson(this);
  }
}
