import 'package:json_annotation/json_annotation.dart';

part 'fulfillment_timeline.g.dart';

@JsonSerializable()
class FulfillmentTimeline {
  String? note;
  String? status;
  String? label;
  bool? current;
  bool? completed;
  dynamic occurredAt;

  FulfillmentTimeline({
    this.status,
    this.note,
    this.label,
    this.current,
    this.completed,
    this.occurredAt,
  });

  factory FulfillmentTimeline.fromJson(Map<String, dynamic> json) {
    return _$FulfillmentTimelineFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FulfillmentTimelineToJson(this);
}
