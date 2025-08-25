import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  bool? success;
  String? message;
  int? statusCode;
  Data? data;

  LoginResponseModel({this.success, this.message, this.statusCode, this.data});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
