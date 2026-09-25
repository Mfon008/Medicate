import 'package:json_annotation/json_annotation.dart';

part 'business_addresses.g.dart';

@JsonSerializable()
class BusinessAddresses {
  String? id;
  String? businessAddress;
  String? country;
  String? state;
  String? lga;
  bool? isActive;
  String? approvalStatus;
  DateTime? submittedAt;
  DateTime? reviewedAt;
  String? reviewedBy;
  bool? isPrimary;

  BusinessAddresses({
    this.id,
    this.businessAddress,
    this.country,
    this.state,
    this.lga,
    this.isActive,
    this.approvalStatus,
    this.submittedAt,
    this.reviewedAt,
    this.reviewedBy,
    this.isPrimary,
  });

  factory BusinessAddresses.fromJson(Map<String, dynamic> json) {
    return _$BusinessAddressesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessAddressesToJson(this);
}
