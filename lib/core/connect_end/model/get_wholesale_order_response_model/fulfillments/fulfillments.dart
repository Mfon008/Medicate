import 'package:json_annotation/json_annotation.dart';

import 'fulfillment_timeline.dart';
import 'timeline.dart';

part 'fulfillments.g.dart';

@JsonSerializable()
class Fulfillments {
  String? fulfillmentGroupId;
  String? assignedDistributorId;
  String? assignedDistributorName;
  String? status;
  String? statusLabel;
  List<String>? orderItemIds;
  List<Timeline>? timeline;
  List<FulfillmentTimeline>? fulfillmentTimeline;

  Fulfillments({
    this.fulfillmentGroupId,
    this.assignedDistributorId,
    this.assignedDistributorName,
    this.status,
    this.statusLabel,
    this.orderItemIds,
    this.timeline,
    this.fulfillmentTimeline,
  });

  factory Fulfillments.fromJson(Map<String, dynamic> json) {
    return _$FulfillmentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FulfillmentsToJson(this);
}
