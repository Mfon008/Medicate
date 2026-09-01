import 'package:json_annotation/json_annotation.dart';

part 'time_block.g.dart';

@JsonSerializable()
class TimeBlock {
  String? name;
  String? startTime;
  String? endTime;

  TimeBlock({this.name, this.startTime, this.endTime});

  factory TimeBlock.fromJson(Map<String, dynamic> json) {
    return _$TimeBlockFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TimeBlockToJson(this);
}
