import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_individual_application_details_model.g.dart';

@JsonSerializable()
class GetIndividualApplicationDetailsModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetIndividualApplicationDetailsModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetIndividualApplicationDetailsModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetIndividualApplicationDetailsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetIndividualApplicationDetailsModelToJson(this);
  }
}
