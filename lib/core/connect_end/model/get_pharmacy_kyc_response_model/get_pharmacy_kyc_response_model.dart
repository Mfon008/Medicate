import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_pharmacy_kyc_response_model.g.dart';

@JsonSerializable()
class GetPharmacyKycResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetPharmacyKycResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetPharmacyKycResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetPharmacyKycResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetPharmacyKycResponseModelToJson(this);
}
