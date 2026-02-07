import 'daily_dose_time.dart';
import 'medication_image.dart';

class Medication {
  String? medicationName;
  // String? drugName;
  String? medicationType;
  String? dosage;
  String? scheduleType;
  DateTime? startDateTime;
  DateTime? endDateTime;
  int? durationInDays;
  int? timesPerDay;
  List<List<DailyDoseTime>>? dailyDoseTimes;
  String? note;
  MedicationImage? medicationImage;

  Medication({
    this.medicationName,
    this.scheduleType,
    this.medicationType,
    this.dosage,
    this.startDateTime,
    this.endDateTime,
    this.durationInDays,
    this.timesPerDay,
    this.dailyDoseTimes,
    this.note,
    this.medicationImage,
  });

  factory Medication.fromJson(Map<String, dynamic> json) => Medication(
    medicationName: json['medicationName'] as String?,
    scheduleType: json['scheduleType'] as String?,
    // drugName: json['drugName'] as String?,
    medicationType: json['medicationType'] as String?,
    dosage: json['dosage'] as String?,
    startDateTime: json['startDateTime'] == null
        ? null
        : DateTime.parse(json['startDateTime'] as String),
    endDateTime: json['endDateTime'] == null
        ? null
        : DateTime.parse(json['endDateTime'] as String),
    durationInDays: json['durationInDays'] as int?,
    timesPerDay: json['timesPerDay'] as int?,
    dailyDoseTimes: (json['dailyDoseTimes'] as List<dynamic>?)
        ?.map(
          (e) => (e as List<dynamic>)
              .map((e) => DailyDoseTime.fromJson(e as Map<String, dynamic>))
              .toList(),
        )
        .toList(),
    note: json['note'] as String?,
    medicationImage: json['medicationImage'] == null
        ? null
        : MedicationImage.fromJson(
            json['medicationImage'] as Map<String, dynamic>,
          ),
  );

  Map<String, dynamic> toJson() => {
    'medicationName': medicationName,
    // 'drugName': drugName,
    'scheduleType': scheduleType,
    'medicationType': medicationType,
    'dosage': dosage,
    'startDateTime': startDateTime?.toIso8601String(),
    'endDateTime': endDateTime?.toIso8601String(),
    'durationInDays': durationInDays,
    'timesPerDay': timesPerDay,
    'dailyDoseTimes': dailyDoseTimes
        ?.map((e) => e.map((e) => e.toJson()).toList())
        .toList(),
    'note': note,
    'medicationImage': medicationImage?.toJson(),
  };
}
