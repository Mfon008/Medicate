import 'daily_dose_time.dart';
import 'medication_image.dart';
import 'payment.dart';

class UpdateReminderEntityModel {
  DateTime? startDateTime;
  DateTime? endDateTime;
  int? durationInDays;
  List<List<DailyDoseTime>>? dailyDoseTimes;
  MedicationImage? medicationImage;
  String? dosage;
  int? timesPerDay;
  List<String>? phoneNumbers;
  List<String>? emails;
  List<String>? notificationChannels;
  Payment? payment;

  UpdateReminderEntityModel({
    this.startDateTime,
    this.endDateTime,
    this.durationInDays,
    this.dailyDoseTimes,
    this.medicationImage,
    this.dosage,
    this.timesPerDay,
    this.phoneNumbers,
    this.emails,
    this.notificationChannels,
    this.payment,
  });

  factory UpdateReminderEntityModel.fromJson(Map<String, dynamic> json) {
    return UpdateReminderEntityModel(
      startDateTime: json['startDateTime'] == null
          ? null
          : DateTime.parse(json['startDateTime'] as String),
      endDateTime: json['endDateTime'] == null
          ? null
          : DateTime.parse(json['endDateTime'] as String),
      durationInDays: json['durationInDays'] as int?,
      dailyDoseTimes: (json['dailyDoseTimes'] as List<dynamic>?)
          ?.map(
            (e) => (e as List<dynamic>)
                .map((e) => DailyDoseTime.fromJson(e as Map<String, dynamic>))
                .toList(),
          )
          .toList(),
      medicationImage: json['medicationImage'] == null
          ? null
          : MedicationImage.fromJson(
              json['medicationImage'] as Map<String, dynamic>,
            ),
      dosage: json['dosage'] as String?,
      timesPerDay: json['timesPerDay'] as int?,
      phoneNumbers: json['phoneNumbers'] as List<String>?,
      emails: json['emails'] as List<String>?,
      notificationChannels: json['notificationChannels'] as List<String>?,
      payment: json['payment'] == null
          ? null
          : Payment.fromJson(json['payment'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'startDateTime': startDateTime?.toIso8601String(),
    'endDateTime': endDateTime?.toIso8601String(),
    'durationInDays': durationInDays,
    'dailyDoseTimes': dailyDoseTimes
        ?.map((e) => e.map((e) => e.toJson()).toList())
        .toList(),
    'medicationImage': medicationImage?.toJson(),
    'dosage': dosage,
    'timesPerDay': timesPerDay,
    'phoneNumbers': phoneNumbers,
    'emails': emails,
    'notificationChannels': notificationChannels,
    'payment': payment?.toJson(),
  };
}
