import 'package:json_annotation/json_annotation.dart';

import 'medication.dart';
import 'payment.dart';
import 'user.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: '_id')
  String? id;
  String? userId;
  String? tenantId;
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
  User? user;

  Data({
    this.id,
    this.userId,
    this.tenantId,
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

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
