import 'package:json_annotation/json_annotation.dart';

part 'rejection_info.g.dart';

@JsonSerializable()
class RejectionInfo {
  bool? isRejected;
  String? rejectionReason;
  String? rejectedAt;

  RejectionInfo({this.isRejected, this.rejectionReason, this.rejectedAt});

  factory RejectionInfo.fromJson(Map<String, dynamic> json) {
    return _$RejectionInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RejectionInfoToJson(this);
}
