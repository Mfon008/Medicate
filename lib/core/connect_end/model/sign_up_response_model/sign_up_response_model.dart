import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  bool? success;
  String? message;
  int? statusCode;
  Data? data;

  SignUpResponseModel({this.success, this.message, this.statusCode, this.data});

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SignUpResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
}
