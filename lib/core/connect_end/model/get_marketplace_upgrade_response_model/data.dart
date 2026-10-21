import 'package:json_annotation/json_annotation.dart';

import 'kyc.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? tenantId;
  String? tenantType;
  String? companyName;
  String? requestId;
  String? status;
  bool? eligible;
  bool? canSellWholesale;
  bool? originalKycApproved;
  Kyc? kyc;
  String? submittedAt;
  String? reviewedAt;
  String? reviewedBy;
  String? rejectionComment;

  Data({
    this.tenantId,
    this.tenantType,
    this.companyName,
    this.requestId,
    this.status,
    this.eligible,
    this.canSellWholesale,
    this.originalKycApproved,
    this.kyc,
    this.submittedAt,
    this.reviewedAt,
    this.reviewedBy,
    this.rejectionComment,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
