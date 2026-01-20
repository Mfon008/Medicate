import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_reminder_for_tenant_response_model.g.dart';

@JsonSerializable()
class GetReminderForTenantResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetReminderForTenantResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetReminderForTenantResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetReminderForTenantResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetReminderForTenantResponseModelToJson(this);
  }
}
