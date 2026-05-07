import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_my_hmo_plan_response_model.g.dart';

@JsonSerializable()
class GetMyHmoPlanResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetMyHmoPlanResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetMyHmoPlanResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetMyHmoPlanResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetMyHmoPlanResponseModelToJson(this);
}
