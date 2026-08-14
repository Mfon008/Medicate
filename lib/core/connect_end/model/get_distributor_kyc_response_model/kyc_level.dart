import 'package:json_annotation/json_annotation.dart';

part 'kyc_level.g.dart';

@JsonSerializable()
class KycLevel {
  int? level;
  String? status;
  DateTime? submittedAt;
  DateTime? reviewedAt;
  String? reviewedBy;
  String? approvalStatus;

  KycLevel({
    this.level,
    this.status,
    this.submittedAt,
    this.reviewedAt,
    this.reviewedBy,
    this.approvalStatus,
  });

  factory KycLevel.fromJson(Map<String, dynamic> json) {
    return _$KycLevelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$KycLevelToJson(this);
}
