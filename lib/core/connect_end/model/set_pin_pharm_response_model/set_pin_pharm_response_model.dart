import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'set_pin_pharm_response_model.g.dart';

@JsonSerializable()
class SetPinPharmResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  SetPinPharmResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory SetPinPharmResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SetPinPharmResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SetPinPharmResponseModelToJson(this);
}
