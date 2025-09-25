import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'update_user_profile_response_model.g.dart';

@JsonSerializable()
class UpdateUserProfileResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  UpdateUserProfileResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory UpdateUserProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UpdateUserProfileResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateUserProfileResponseModelToJson(this);
  }
}
