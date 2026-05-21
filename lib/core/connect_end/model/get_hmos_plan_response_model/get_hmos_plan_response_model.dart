import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_hmos_plan_response_model.g.dart';

@JsonSerializable()
class GetHmosPlanResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetHmosPlanResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetHmosPlanResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetHmosPlanResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetHmosPlanResponseModelToJson(this);
}
