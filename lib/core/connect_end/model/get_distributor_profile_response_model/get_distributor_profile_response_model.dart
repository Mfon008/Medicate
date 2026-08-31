import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_distributor_profile_response_model.g.dart';

@JsonSerializable()
class GetDistributorProfileResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetDistributorProfileResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetDistributorProfileResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetDistributorProfileResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetDistributorProfileResponseModelToJson(this);
  }
}
