import 'package:json_annotation/json_annotation.dart';

part 'kyc_level.g.dart';

@JsonSerializable()
class KycLevel {
  int? level;
  String? status;
  String? rejectionComment;
  dynamic submittedAt;
  dynamic reviewedAt;
  String? reviewedBy;

  KycLevel({
    this.level,
    this.status,
    this.rejectionComment,
    this.submittedAt,
    this.reviewedAt,
    this.reviewedBy,
  });

  factory KycLevel.fromJson(Map<String, dynamic> json) {
    return _$KycLevelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$KycLevelToJson(this);
}
