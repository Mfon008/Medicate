import 'package:json_annotation/json_annotation.dart';

part 'schedule_of_plans.g.dart';

@JsonSerializable()
class ScheduleOfPlans {
  String? url;
  String? mimeType;
  int? size;
  int? width;
  int? height;
  String? format;

  ScheduleOfPlans({
    this.url,
    this.mimeType,
    this.size,
    this.width,
    this.height,
    this.format,
  });

  factory ScheduleOfPlans.fromJson(Map<String, dynamic> json) {
    return _$ScheduleOfPlansFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ScheduleOfPlansToJson(this);
}
