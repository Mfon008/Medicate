import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'active_hmo_plan_response_model.g.dart';

@JsonSerializable()
class ActiveHmoPlanResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  ActiveHmoPlanResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory ActiveHmoPlanResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ActiveHmoPlanResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ActiveHmoPlanResponseModelToJson(this);
}
