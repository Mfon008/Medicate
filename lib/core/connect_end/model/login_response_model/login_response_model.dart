import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  LoginResponseModel({this.success, this.statusCode, this.message, this.data});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
