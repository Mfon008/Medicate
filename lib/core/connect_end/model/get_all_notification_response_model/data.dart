import 'package:json_annotation/json_annotation.dart';

import 'meta.dart';
import 'notification.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Notification>? notifications;
  Meta? meta;

  Data({this.notifications, this.meta});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
