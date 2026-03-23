import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'start_application_rsponse_model.g.dart';

@JsonSerializable()
class StartApplicationRsponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  StartApplicationRsponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory StartApplicationRsponseModel.fromJson(Map<String, dynamic> json) {
    return _$StartApplicationRsponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StartApplicationRsponseModelToJson(this);
}
