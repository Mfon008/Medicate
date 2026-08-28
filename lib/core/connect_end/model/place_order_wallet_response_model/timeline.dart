import 'package:json_annotation/json_annotation.dart';

part 'timeline.g.dart';

@JsonSerializable()
class Timeline {
  String? status;
  DateTime? occurredAt;

  Timeline({this.status, this.occurredAt});

  factory Timeline.fromJson(Map<String, dynamic> json) {
    return _$TimelineFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TimelineToJson(this);
}
