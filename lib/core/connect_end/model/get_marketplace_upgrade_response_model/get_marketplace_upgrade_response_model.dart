import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_marketplace_upgrade_response_model.g.dart';

@JsonSerializable()
class GetMarketplaceUpgradeResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetMarketplaceUpgradeResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetMarketplaceUpgradeResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetMarketplaceUpgradeResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetMarketplaceUpgradeResponseModelToJson(this);
  }
}
