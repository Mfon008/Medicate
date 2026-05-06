import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_hmo_kyc_response_model.g.dart';

@JsonSerializable()
class GetHmoKycResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetHmoKycResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetHmoKycResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetHmoKycResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetHmoKycResponseModelToJson(this);
}
