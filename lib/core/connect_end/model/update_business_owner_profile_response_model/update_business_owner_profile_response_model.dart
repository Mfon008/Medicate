import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'update_business_owner_profile_response_model.g.dart';

@JsonSerializable()
class UpdateBusinessOwnerProfileResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  UpdateBusinessOwnerProfileResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory UpdateBusinessOwnerProfileResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$UpdateBusinessOwnerProfileResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateBusinessOwnerProfileResponseModelToJson(this);
  }
}
