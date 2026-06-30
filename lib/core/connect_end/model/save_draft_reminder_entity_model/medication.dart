import 'package:json_annotation/json_annotation.dart';
import 'package:medicate_app/core/connect_end/model/save_draft_reminder_entity_model/medication_image.dart';

import 'daily_dose_time.dart';

part 'medication.g.dart';

@JsonSerializable()
class Medication {
  String? medicationName;
  String? medicationType;
  String? dosage;
  DateTime? startDateTime;
  DateTime? endDateTime;
  int? durationInDays;
  String? scheduleType;
  int? timesPerDay;
  List<List<DailyDoseTime>>? dailyDoseTimes;
  String? note;
  MedicationImage? medicationImage;

  Medication({
    this.medicationName,
    this.medicationType,
    this.dosage,
    this.startDateTime,
    this.endDateTime,
    this.durationInDays,
    this.scheduleType,
    this.timesPerDay,
    this.dailyDoseTimes,
    this.note,
    this.medicationImage,
  });

  factory Medication.fromJson(Map<String, dynamic> json) {
    return _$MedicationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicationToJson(this);
}
