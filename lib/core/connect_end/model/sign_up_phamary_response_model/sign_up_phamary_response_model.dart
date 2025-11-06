import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'sign_up_phamary_response_model.g.dart';

@JsonSerializable()
class SignUpPhamaryResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  SignUpPhamaryResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory SignUpPhamaryResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SignUpPhamaryResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignUpPhamaryResponseModelToJson(this);
}
