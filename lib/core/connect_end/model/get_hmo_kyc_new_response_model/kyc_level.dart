import 'package:json_annotation/json_annotation.dart';

part 'kyc_level.g.dart';

@JsonSerializable()
class KycLevel {
  int? level;
  String? status;
  String? approvalStatus;
  dynamic submittedAt;

  KycLevel({this.level, this.status, this.approvalStatus, this.submittedAt});

  factory KycLevel.fromJson(Map<String, dynamic> json) {
    return _$KycLevelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$KycLevelToJson(this);
}
