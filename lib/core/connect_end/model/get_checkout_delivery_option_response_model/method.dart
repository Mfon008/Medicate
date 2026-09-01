import 'package:json_annotation/json_annotation.dart';

import 'time_block.dart';

part 'method.g.dart';

@JsonSerializable()
class Method {
  String? method;
  bool? available;
  int? deliveryFee;
  List<dynamic>? unavailableReasons;
  int? minimumLeadTimeDays;
  List<String>? availableDeliveryDays;
  List<TimeBlock>? timeBlocks;

  Method({
    this.method,
    this.available,
    this.deliveryFee,
    this.unavailableReasons,
    this.minimumLeadTimeDays,
    this.availableDeliveryDays,
    this.timeBlocks,
  });

  factory Method.fromJson(Map<String, dynamic> json) {
    return _$MethodFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MethodToJson(this);
}
