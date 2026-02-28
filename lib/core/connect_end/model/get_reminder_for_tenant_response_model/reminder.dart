import 'package:json_annotation/json_annotation.dart';

import 'medication.dart';
import 'patient_details.dart';
import 'payment.dart';
import 'user.dart';

part 'reminder.g.dart';

@JsonSerializable()
class Reminder {
  @JsonKey(name: '_id')
  String? id;
  String? userId;
  String? tenantId;
  PatientDetails? patientDetails;
  Medication? medication;
  String? timeZone;
  bool? isActive;
  List<String>? notificationChannels;
  List<dynamic>? phoneNumbers;
  List<String>? emails;
  List<Payment>? payments;
  String? reminderGroupId;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  Reminder({
    this.id,
    this.userId,
    this.tenantId,
    this.patientDetails,
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
    this.user,
  });

  factory Reminder.fromJson(Map<String, dynamic> json) {
    return _$ReminderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReminderToJson(this);
}
