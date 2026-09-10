import 'package:json_annotation/json_annotation.dart';

part 'status_counts.g.dart';

@JsonSerializable()
class StatusCounts {
  @JsonKey(name: 'DELIVERED')
  int? delivered;

  StatusCounts({this.delivered});

  factory StatusCounts.fromJson(Map<String, dynamic> json) {
    return _$StatusCountsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StatusCountsToJson(this);
}
