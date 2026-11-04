import 'package:json_annotation/json_annotation.dart';

part 'status_counts.g.dart';

@JsonSerializable()
class StatusCounts {
  @JsonKey(name: 'PENDING')
  int? pending;

  StatusCounts({this.pending});

  factory StatusCounts.fromJson(Map<String, dynamic> json) {
    return _$StatusCountsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StatusCountsToJson(this);
}
