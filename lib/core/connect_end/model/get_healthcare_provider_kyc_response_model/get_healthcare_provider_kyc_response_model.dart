import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_healthcare_provider_kyc_response_model.g.dart';

@JsonSerializable()
class GetHealthcareProviderKycResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetHealthcareProviderKycResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetHealthcareProviderKycResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetHealthcareProviderKycResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetHealthcareProviderKycResponseModelToJson(this);
  }
}
