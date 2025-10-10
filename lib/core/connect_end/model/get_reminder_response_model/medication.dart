import 'package:json_annotation/json_annotation.dart';

import 'daily_dose_time.dart';
import 'medication_image.dart';

part 'medication.g.dart';

@JsonSerializable()
class Medication {
  String? medicationName;
  String? drugName;
  String? medicationType;
  String? dosage;
  DateTime? startDateTime;
  int? durationInDays;
  DateTime? endDateTime;
  int? timesPerDay;
  String? note;
  List<List<DailyDoseTime>>? dailyDoseTimes;
  String? medicationStatus;
  MedicationImage? medicationImage;
  @JsonKey(name: '_id')
  String? id;

  Medication({
    this.medicationName,
    this.drugName,
    this.medicationType,
    this.dosage,
    this.startDateTime,
    this.durationInDays,
    this.endDateTime,
    this.timesPerDay,
    this.note,
    this.dailyDoseTimes,
    this.medicationStatus,
    this.medicationImage,
    this.id,
  });

  factory Medication.fromJson(Map<String, dynamic> json) {
    return _$MedicationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicationToJson(this);
}
