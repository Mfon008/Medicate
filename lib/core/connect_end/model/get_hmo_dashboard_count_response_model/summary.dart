import 'package:json_annotation/json_annotation.dart';

part 'summary.g.dart';

@JsonSerializable()
class Summary {
  int? activeCount;
  int? reviewPendingCount;
  int? draftCount;
  int? rejectedCount;

  Summary({
    this.activeCount,
    this.reviewPendingCount,
    this.draftCount,
    this.rejectedCount,
  });

  factory Summary.fromJson(Map<String, dynamic> json) {
    return _$SummaryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SummaryToJson(this);
}
