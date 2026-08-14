import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_distributor_kyc_response_model.g.dart';

@JsonSerializable()
class GetDistributorKycResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetDistributorKycResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetDistributorKycResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetDistributorKycResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetDistributorKycResponseModelToJson(this);
  }
}
