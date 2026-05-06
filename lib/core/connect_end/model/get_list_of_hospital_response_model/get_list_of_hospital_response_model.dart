import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_list_of_hospital_response_model.g.dart';

@JsonSerializable()
class GetListOfHospitalResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetListOfHospitalResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetListOfHospitalResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetListOfHospitalResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetListOfHospitalResponseModelToJson(this);
  }
}
