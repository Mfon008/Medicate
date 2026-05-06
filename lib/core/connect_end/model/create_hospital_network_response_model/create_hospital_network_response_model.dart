import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'create_hospital_network_response_model.g.dart';

@JsonSerializable()
class CreateHospitalNetworkResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  CreateHospitalNetworkResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory CreateHospitalNetworkResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$CreateHospitalNetworkResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CreateHospitalNetworkResponseModelToJson(this);
  }
}
