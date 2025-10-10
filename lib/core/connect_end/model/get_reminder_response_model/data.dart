import 'package:json_annotation/json_annotation.dart';

import 'meta.dart';
import 'reminder.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Reminder>? reminders;
  Meta? meta;

  Data({this.reminders, this.meta});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
