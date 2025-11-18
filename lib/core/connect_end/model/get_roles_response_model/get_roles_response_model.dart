import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_roles_response_model.g.dart';

@JsonSerializable()
class GetRolesResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetRolesResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetRolesResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetRolesResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetRolesResponseModelToJson(this);
}
