import 'package:medicate_app/core/connect_end/model/update_reminder_entity_model/medication_image.dart';

import 'daily_dose_time.dart';
import 'patient_details.dart';
import 'payment.dart';

class UpdateReminderEntityModel {
  PatientDetails? patientDetails;
  String? medicationName;
  String? medicationType;
  String? description;
  String? dosage;
  DateTime? startDateTime;
  DateTime? endDateTime;
  int? durationInDays;
  String? scheduleType;
  int? timesPerDay;
  String? note;
  String? timeZone;
  List<List<DailyDoseTime>>? dailyDoseTimes;
  List<String>? notificationChannels;
  List<String>? phoneNumbers;
  List<String>? emails;
  Payment? payment;
  MedicationImage? medicationImage;

  UpdateReminderEntityModel({
    this.patientDetails,
    this.medicationName,
    this.medicationType,
    this.description,
    this.dosage,
    this.startDateTime,
    this.endDateTime,
    this.durationInDays,
    this.scheduleType,
    this.timesPerDay,
    this.note,
    this.timeZone,
    this.dailyDoseTimes,
    this.notificationChannels,
    this.phoneNumbers,
    this.emails,
    this.payment,
    this.medicationImage,
  });

  factory UpdateReminderEntityModel.fromJson(Map<String, dynamic> json) {
    return UpdateReminderEntityModel(
      patientDetails: json['patientDetails'] == null
          ? null
          : PatientDetails.fromJson(
              json['patientDetails'] as Map<String, dynamic>,
            ),
      medicationName: json['medicationName'] as String?,
      medicationType: json['medicationType'] as String?,
      description: json['description'] as String?,
      dosage: json['dosage'] as String?,
      startDateTime: json['startDateTime'] == null
          ? null
          : DateTime.parse(json['startDateTime'] as String),
      endDateTime: json['endDateTime'] == null
          ? null
          : DateTime.parse(json['endDateTime'] as String),
      durationInDays: json['durationInDays'] as int?,
      scheduleType: json['scheduleType'] as String?,
      timesPerDay: json['timesPerDay'] as int?,
      note: json['note'] as String?,
      timeZone: json['timeZone'] as String?,
      dailyDoseTimes: (json['dailyDoseTimes'] as List<dynamic>?)
          ?.map(
            (e) => (e as List<dynamic>)
                .map((e) => DailyDoseTime.fromJson(e as Map<String, dynamic>))
                .toList(),
          )
          .toList(),
      notificationChannels: json['notificationChannels'] as List<String>?,
      phoneNumbers: json['phoneNumbers'] as List<String>?,
      emails: json['emails'] as List<String>?,
      payment: json['payment'] == null
          ? null
          : Payment.fromJson(json['payment'] as Map<String, dynamic>),
      medicationImage: json['medicationImage'] == null
          ? null
          : MedicationImage.fromJson(
              json['medicationImage'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() => {
    'patientDetails': patientDetails?.toJson(),
    'medicationName': medicationName,
    'medicationType': medicationType,
    'description': description,
    'dosage': dosage,
    'startDateTime': startDateTime?.toIso8601String(),
    'endDateTime': endDateTime?.toIso8601String(),
    'durationInDays': durationInDays,
    'scheduleType': scheduleType,
    'timesPerDay': timesPerDay,
    'note': note,
    'timeZone': timeZone,
    'dailyDoseTimes': dailyDoseTimes
        ?.map((e) => e.map((e) => e.toJson()).toList())
        .toList(),
    'notificationChannels': notificationChannels,
    'phoneNumbers': phoneNumbers,
    'emails': emails,
    'payment': payment?.toJson(),
    'medicationImage': medicationImage?.toJson(),
  };
}
