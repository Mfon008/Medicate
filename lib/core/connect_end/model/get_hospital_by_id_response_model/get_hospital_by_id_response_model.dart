import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_hospital_by_id_response_model.g.dart';

@JsonSerializable()
class GetHospitalByIdResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetHospitalByIdResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetHospitalByIdResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetHospitalByIdResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetHospitalByIdResponseModelToJson(this);
}
