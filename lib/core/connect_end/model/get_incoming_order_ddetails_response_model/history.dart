import 'package:json_annotation/json_annotation.dart';

part 'history.g.dart';

@JsonSerializable()
class History {
  String? action;
  String? status;
  DateTime? occurredAt;
  int? generation;

  History({this.action, this.status, this.occurredAt, this.generation});

  factory History.fromJson(Map<String, dynamic> json) {
    return _$HistoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}
