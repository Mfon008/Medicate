import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification {
  String? id;
  String? reminderId;
  String? userId;
  String? username;
  String? doseTime;
  String? dosage;
  String? doseId;
  String? medicationName;
  String? scheduledAt;
  bool? isRead;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? type;
  String? title;
  String? body;
  Data? data;
  DateTime? readAt;

  Notification({
    this.id,
    this.reminderId,
    this.userId,
    this.username,
    this.doseTime,
    this.dosage,
    this.doseId,
    this.medicationName,
    this.scheduledAt,
    this.isRead,
    this.createdAt,
    this.updatedAt,
    this.type,
    this.title,
    this.body,
    this.data,
    this.readAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return _$NotificationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
