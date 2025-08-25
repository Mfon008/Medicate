import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'change_pin_response_model.g.dart';

@JsonSerializable()
class ChangePinResponseModel {
  bool? success;
  String? message;
  int? statusCode;
  Data? data;

  ChangePinResponseModel({
    this.success,
    this.message,
    this.statusCode,
    this.data,
  });

  factory ChangePinResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ChangePinResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChangePinResponseModelToJson(this);
}
