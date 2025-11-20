import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_user_details_no_phone_model.g.dart';

@JsonSerializable()
class GetUserDetailsNoPhoneModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetUserDetailsNoPhoneModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetUserDetailsNoPhoneModel.fromJson(Map<String, dynamic> json) {
    return _$GetUserDetailsNoPhoneModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetUserDetailsNoPhoneModelToJson(this);
}
