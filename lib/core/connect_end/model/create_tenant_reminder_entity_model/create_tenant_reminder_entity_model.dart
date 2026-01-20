import 'medication.dart';
import 'payment.dart';

class CreateTenantReminderEntityModel {
  List<Medication>? medications;
  String? timeZone;
  List<String>? notificationChannels;
  List<String>? emails;
  String? patientId;
  List<String>? phoneNumbers;
  Payment? payment;

  CreateTenantReminderEntityModel({
    this.medications,
    this.patientId,
    this.timeZone,
    this.notificationChannels,
    this.emails,
    this.phoneNumbers,
    this.payment,
  });

  factory CreateTenantReminderEntityModel.fromJson(Map<String, dynamic> json) {
    return CreateTenantReminderEntityModel(
      medications: (json['medications'] as List<dynamic>?)
          ?.map((e) => Medication.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeZone: json['timeZone'] as String?,
      notificationChannels: json['notificationChannels'] as List<String>?,
      emails: json['emails'] as List<String>?,
      patientId: json['patientId'] as String?,
      phoneNumbers: json['phoneNumbers'] as List<String>?,
      payment: json['payment'] == null
          ? null
          : Payment.fromJson(json['payment'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'medications': medications?.map((e) => e.toJson()).toList(),
    'patientId': patientId,
    'timeZone': timeZone,
    'notificationChannels': notificationChannels,
    'emails': emails,
    'phoneNumbers': phoneNumbers,
    'payment': payment?.toJson(),
  };
}
