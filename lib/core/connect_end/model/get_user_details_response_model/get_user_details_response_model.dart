import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_user_details_response_model.g.dart';

@JsonSerializable()
class GetUserDetailsResponseModel {
  bool? success;
  String? message;
  int? statusCode;
  Data? data;

  GetUserDetailsResponseModel({
    this.success,
    this.message,
    this.statusCode,
    this.data,
  });

  factory GetUserDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetUserDetailsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetUserDetailsResponseModelToJson(this);
}
