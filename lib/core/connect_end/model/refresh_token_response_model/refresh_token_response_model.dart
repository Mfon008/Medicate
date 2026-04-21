import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'refresh_token_response_model.g.dart';

@JsonSerializable()
class RefreshTokenResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  RefreshTokenResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) {
    return _$RefreshTokenResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RefreshTokenResponseModelToJson(this);
}
