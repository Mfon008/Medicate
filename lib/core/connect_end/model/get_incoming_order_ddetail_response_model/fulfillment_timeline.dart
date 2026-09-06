import 'package:json_annotation/json_annotation.dart';

part 'fulfillment_timeline.g.dart';

@JsonSerializable()
class FulfillmentTimeline {
  String? status;
  String? label;
  bool? completed;
  bool? current;
  dynamic occurredAt;

  FulfillmentTimeline({
    this.status,
    this.label,
    this.completed,
    this.current,
    this.occurredAt,
  });

  factory FulfillmentTimeline.fromJson(Map<String, dynamic> json) {
    return _$FulfillmentTimelineFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FulfillmentTimelineToJson(this);
}
