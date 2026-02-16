import 'package:json_annotation/json_annotation.dart';
import 'package:medicate_app/core/connect_end/model/get_reminder_for_tenant_response_model/medication_image.dart';

import 'daily_dose_time.dart';

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
