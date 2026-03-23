import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_hmos_plan_response_model.g.dart';

@JsonSerializable()
class GetHmosPlanResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  List<Datum>? data;

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
