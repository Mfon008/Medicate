import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'set_pin_response_model.g.dart';

@JsonSerializable()
class SetPinResponseModel {
  bool? success;
  String? message;
  int? statusCode;
  Data? data;

  SetPinResponseModel({this.success, this.message, this.statusCode, this.data});

  factory SetPinResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SetPinResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SetPinResponseModelToJson(this);
}
