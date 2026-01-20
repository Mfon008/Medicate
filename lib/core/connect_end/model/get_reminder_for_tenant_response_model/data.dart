import 'package:json_annotation/json_annotation.dart';
import 'package:medicate_app/core/connect_end/model/get_reminder_for_tenant_response_model/reminder.dart';

import 'meta.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Reminder>? data;
  Meta? meta;

  Data({this.data, this.meta});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
