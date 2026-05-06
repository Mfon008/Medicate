import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'create_hmo_plan_reponse_model.g.dart';

@JsonSerializable()
class CreateHmoPlanReponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  CreateHmoPlanReponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory CreateHmoPlanReponseModel.fromJson(Map<String, dynamic> json) {
    return _$CreateHmoPlanReponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateHmoPlanReponseModelToJson(this);
}
