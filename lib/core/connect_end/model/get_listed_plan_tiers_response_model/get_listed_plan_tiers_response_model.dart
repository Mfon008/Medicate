import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_listed_plan_tiers_response_model.g.dart';

@JsonSerializable()
class GetListedPlanTiersResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetListedPlanTiersResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetListedPlanTiersResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetListedPlanTiersResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetListedPlanTiersResponseModelToJson(this);
  }
}
