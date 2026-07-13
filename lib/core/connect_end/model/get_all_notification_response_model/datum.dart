import 'package:json_annotation/json_annotation.dart';

import 'meta.dart';
import 'notification.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  List<Notification>? notifications;
  Meta? meta;

  Datum({this.notifications, this.meta});

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
