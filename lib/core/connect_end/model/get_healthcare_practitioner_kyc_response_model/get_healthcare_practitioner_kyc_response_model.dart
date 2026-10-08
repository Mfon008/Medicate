import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_healthcare_practitioner_kyc_response_model.g.dart';

@JsonSerializable()
class GetHealthcarePractitionerKycResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetHealthcarePractitionerKycResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetHealthcarePractitionerKycResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetHealthcarePractitionerKycResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetHealthcarePractitionerKycResponseModelToJson(this);
  }
}
