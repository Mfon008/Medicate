import 'package:json_annotation/json_annotation.dart';

part 'business_address.g.dart';

@JsonSerializable()
class BusinessAddress {
  String? id;
  String? businessAddress;
  String? country;
  String? state;
  String? lga;
  bool? isActive;
  String? approvalStatus;
  dynamic submittedAt;
  bool? isPrimary;

  BusinessAddress({
    this.id,
    this.businessAddress,
    this.country,
    this.state,
    this.lga,
    this.isActive,
    this.approvalStatus,
    this.submittedAt,
    this.isPrimary,
  });

  factory BusinessAddress.fromJson(Map<String, dynamic> json) {
    return _$BusinessAddressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessAddressToJson(this);
}
