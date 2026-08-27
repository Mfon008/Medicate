import 'package:json_annotation/json_annotation.dart';

part 'tracking.g.dart';

@JsonSerializable()
class Tracking {
  String? status;
  String? label;
  bool? completed;
  bool? current;
  String? occurredAt;

  Tracking({
    this.status,
    this.label,
    this.completed,
    this.current,
    this.occurredAt,
  });

  factory Tracking.fromJson(Map<String, dynamic> json) {
    return _$TrackingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TrackingToJson(this);
}
