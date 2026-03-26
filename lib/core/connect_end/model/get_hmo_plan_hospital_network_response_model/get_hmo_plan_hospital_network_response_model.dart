import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_hmo_plan_hospital_network_response_model.g.dart';

@JsonSerializable()
class GetHmoPlanHospitalNetworkResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetHmoPlanHospitalNetworkResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetHmoPlanHospitalNetworkResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetHmoPlanHospitalNetworkResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetHmoPlanHospitalNetworkResponseModelToJson(this);
  }
}
