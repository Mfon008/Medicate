import 'package:json_annotation/json_annotation.dart';
import 'package:medicate_app/core/connect_end/model/get_reminder_draft_response_model/medication_image.dart';

import 'daily_dose_time.dart';

part 'medication.g.dart';

@JsonSerializable()
class Medication {
  String? medicationName;
  String? medicationType;
  MedicationImage? medicationImage;
  String? dosage;
  DateTime? startDateTime;
  int? durationInDays;
  DateTime? endDateTime;
  int? timesPerDay;
  String? scheduleType;
  List<List<DailyDoseTime>>? dailyDoseTimes;
  String? note;

  Medication({
    this.medicationName,
    this.medicationType,
    this.dosage,
    this.startDateTime,
    this.durationInDays,
    this.endDateTime,
    this.timesPerDay,
    this.scheduleType,
    this.dailyDoseTimes,
    this.note,
    this.medicationImage
  });

  factory Medication.fromJson(Map<String, dynamic> json) {
    return _$MedicationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicationToJson(this);
}
