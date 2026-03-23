import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'active_hmo_plan_response_model.g.dart';

@JsonSerializable()
class ActiveHmoPlanResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  List<Datum>? data;

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
