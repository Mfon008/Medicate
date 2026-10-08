import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_hmo_kyc_new_response_model.g.dart';

@JsonSerializable()
class GetHmoKycNewResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetHmoKycNewResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetHmoKycNewResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetHmoKycNewResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetHmoKycNewResponseModelToJson(this);
}
