import 'package:json_annotation/json_annotation.dart';

import 'medication.dart';
import 'payment.dart';

part 'reminder.g.dart';

@JsonSerializable()
class Reminder {
  @JsonKey(name: '_id')
  String? id;
  String? trackingId;
  String? userId;
  Medication? medication;
  String? timeZone;
  bool? isActive;
  List<String>? notificationChannels;
  List<String>? phoneNumbers;
  List<String>? emails;
  List<Payment>? payments;
  String? reminderGroupId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Reminder({
    this.id,
    this.trackingId,
    this.userId,
    this.medication,
    this.timeZone,
    this.isActive,
    this.notificationChannels,
    this.phoneNumbers,
    this.emails,
    this.payments,
    this.reminderGroupId,
    this.createdAt,
    this.updatedAt,
  });

  factory Reminder.fromJson(Map<String, dynamic> json) {
    return _$ReminderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReminderToJson(this);
}
