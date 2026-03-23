import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'save_third_step_response_model.g.dart';

@JsonSerializable()
class SaveThirdStepResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  SaveThirdStepResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory SaveThirdStepResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SaveThirdStepResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SaveThirdStepResponseModelToJson(this);
}
