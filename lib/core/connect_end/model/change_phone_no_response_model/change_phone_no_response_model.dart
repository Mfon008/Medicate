import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'change_phone_no_response_model.g.dart';

@JsonSerializable()
class ChangePhoneNoResponseModel {
  bool? success;
  String? message;
  int? statusCode;
  Data? data;

  ChangePhoneNoResponseModel({
    this.success,
    this.message,
    this.statusCode,
    this.data,
  });

  factory ChangePhoneNoResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ChangePhoneNoResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChangePhoneNoResponseModelToJson(this);
}
