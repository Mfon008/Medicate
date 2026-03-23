import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'save_first_step_personal_response_model.g.dart';

@JsonSerializable()
class SaveFirstStepPersonalResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  SaveFirstStepPersonalResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory SaveFirstStepPersonalResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$SaveFirstStepPersonalResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SaveFirstStepPersonalResponseModelToJson(this);
  }
}
