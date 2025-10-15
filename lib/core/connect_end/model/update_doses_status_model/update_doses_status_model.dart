import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'update_doses_status_model.g.dart';

@JsonSerializable()
class UpdateDosesStatusModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  UpdateDosesStatusModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory UpdateDosesStatusModel.fromJson(Map<String, dynamic> json) {
    return _$UpdateDosesStatusModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateDosesStatusModelToJson(this);
}
