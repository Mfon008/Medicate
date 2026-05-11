import 'package:json_annotation/json_annotation.dart';

part 'schedule_of_plans.g.dart';

@JsonSerializable()
class ScheduleOfPlans {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  ScheduleOfPlans({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory ScheduleOfPlans.fromJson(Map<String, dynamic> json) {
    return _$ScheduleOfPlansFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ScheduleOfPlansToJson(this);
}
