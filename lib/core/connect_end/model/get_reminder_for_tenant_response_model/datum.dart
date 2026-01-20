import 'package:json_annotation/json_annotation.dart';
import 'package:medicate_app/core/connect_end/model/get_reminder_for_tenant_response_model/payment.dart';

import 'medication.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  @JsonKey(name: '_id')
  String? id;
  String? userId;
  String? tenantId;
  Medication? medication;
  String? timeZone;
  bool? isActive;
  List<String>? notificationChannels;
  List<dynamic>? phoneNumbers;
  List<dynamic>? emails;
  String? reminderGroupId;
  List<Payment>? payments;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic user;

  Datum({
    this.id,
    this.userId,
    this.tenantId,
    this.medication,
    this.timeZone,
    this.isActive,
    this.notificationChannels,
    this.phoneNumbers,
    this.emails,
    this.reminderGroupId,
    this.payments,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
