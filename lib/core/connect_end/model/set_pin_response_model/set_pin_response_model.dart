import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'set_pin_response_model.g.dart';

@JsonSerializable()
class SetPinResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  SetPinResponseModel({this.success, this.statusCode, this.message, this.data});

  factory SetPinResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SetPinResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SetPinResponseModelToJson(this);
}
