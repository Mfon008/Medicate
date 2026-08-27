import 'package:json_annotation/json_annotation.dart';

import 'timeline.dart';

part 'distributor_fulfillment.g.dart';

@JsonSerializable()
class DistributorFulfillment {
  String? distributorId;
  String? distributorName;
  String? status;
  List<Timeline>? timeline;

  DistributorFulfillment({
    this.distributorId,
    this.distributorName,
    this.status,
    this.timeline,
  });

  factory DistributorFulfillment.fromJson(Map<String, dynamic> json) {
    return _$DistributorFulfillmentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DistributorFulfillmentToJson(this);
}
