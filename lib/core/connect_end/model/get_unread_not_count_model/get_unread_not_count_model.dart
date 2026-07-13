import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_unread_not_count_model.g.dart';

@JsonSerializable()
class GetUnreadNotCountModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetUnreadNotCountModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetUnreadNotCountModel.fromJson(Map<String, dynamic> json) {
    return _$GetUnreadNotCountModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetUnreadNotCountModelToJson(this);
}
