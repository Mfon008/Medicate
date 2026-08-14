import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'nafdac_registration_number_response_model.g.dart';

@JsonSerializable()
class NafdacRegistrationNumberResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  NafdacRegistrationNumberResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory NafdacRegistrationNumberResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$NafdacRegistrationNumberResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NafdacRegistrationNumberResponseModelToJson(this);
  }
}
