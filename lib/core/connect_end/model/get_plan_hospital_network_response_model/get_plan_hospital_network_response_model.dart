import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_plan_hospital_network_response_model.g.dart';

@JsonSerializable()
class GetPlanHospitalNetworkResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetPlanHospitalNetworkResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetPlanHospitalNetworkResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetPlanHospitalNetworkResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetPlanHospitalNetworkResponseModelToJson(this);
  }
}
