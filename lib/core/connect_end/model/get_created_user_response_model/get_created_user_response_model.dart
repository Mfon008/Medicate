import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_created_user_response_model.g.dart';

@JsonSerializable()
class GetCreatedUserResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetCreatedUserResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetCreatedUserResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetCreatedUserResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCreatedUserResponseModelToJson(this);
}
