import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'save_second_step_response_model.g.dart';

@JsonSerializable()
class SaveSecondStepResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  SaveSecondStepResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory SaveSecondStepResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SaveSecondStepResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SaveSecondStepResponseModelToJson(this);
}
