import 'medication.dart';
import 'patient_details.dart';
import 'payment.dart';

class CreateTenantReminderEntityModel {
  List<Medication>? medications;
  String? timeZone;
  List<String>? notificationChannels;
  List<String>? emails;
  List<String>? phoneNumbers;
  Payment? payment;
  PatientDetails? patientDetails;

  CreateTenantReminderEntityModel({
    this.medications,
    this.timeZone,
    this.notificationChannels,
    this.emails,
    this.phoneNumbers,
    this.payment,
    this.patientDetails,
  });

  factory CreateTenantReminderEntityModel.fromJson(Map<String, dynamic> json) {
    return CreateTenantReminderEntityModel(
      medications: (json['medications'] as List<dynamic>?)
          ?.map((e) => Medication.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeZone: json['timeZone'] as String?,
      notificationChannels: json['notificationChannels'] as List<String>?,
      emails: json['emails'] as List<String>?,
      phoneNumbers: json['phoneNumbers'] as List<String>?,
      patientDetails: json['patientDetails'] == null
          ? null
          : PatientDetails.fromJson(
              json['patientDetails'] as Map<String, dynamic>,
            ),
      payment: json['payment'] == null
          ? null
          : Payment.fromJson(json['payment'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'medications': medications?.map((e) => e.toJson()).toList(),
    'timeZone': timeZone,
    'notificationChannels': notificationChannels,
    'emails': emails,
    'phoneNumbers': phoneNumbers,
    'payment': payment?.toJson(),
    'patientDetails': patientDetails?.toJson(),
  };
}
