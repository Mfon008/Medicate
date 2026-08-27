import 'package:json_annotation/json_annotation.dart';

part 'time_block.g.dart';

@JsonSerializable()
class TimeBlock {
  String? id;
  String? name;
  String? startTime;
  String? endTime;
  int? maxOrders;
  int? remainingCapacity;

  TimeBlock({
    this.id,
    this.name,
    this.startTime,
    this.endTime,
    this.maxOrders,
    this.remainingCapacity,
  });

  factory TimeBlock.fromJson(Map<String, dynamic> json) {
    return _$TimeBlockFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TimeBlockToJson(this);
}
