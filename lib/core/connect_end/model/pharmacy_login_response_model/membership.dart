import 'package:json_annotation/json_annotation.dart';

part 'membership.g.dart';

@JsonSerializable()
class Membership {
  String? tenantId;
  String? tenantName;
  String? tenantType;
  String? role;
  List<String>? permissions;
  String? kycStatus;
  int? profileCompletionPercentage;

  Membership({
    this.tenantId,
    this.tenantName,
    this.tenantType,
    this.role,
    this.permissions,
    this.kycStatus,
    this.profileCompletionPercentage,
  });

  factory Membership.fromJson(Map<String, dynamic> json) {
    return _$MembershipFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MembershipToJson(this);
}
