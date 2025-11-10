import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_tenant_response_model.g.dart';

@JsonSerializable()
class GetTenantResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetTenantResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetTenantResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetTenantResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetTenantResponseModelToJson(this);
}
