import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'distributor_wholesale_category_model.g.dart';

@JsonSerializable()
class DistributorWholesaleCategoryModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  DistributorWholesaleCategoryModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory DistributorWholesaleCategoryModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$DistributorWholesaleCategoryModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DistributorWholesaleCategoryModelToJson(this);
  }
}
