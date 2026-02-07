import 'dart:io';
import '../../../core/connect_end/model/create_reminder_entity_model/daily_dose_time.dart';
import '../../../core/connect_end/model/upload_image_reminder_response_model/data.dart';

class MedicationClass {
  String? medicationName;
  String? drugName;
  String? medicationType;
  String? medicationTypeIcon;
  String? description;
  File? medicationFile;
  Data? imageData;
  String? dosage;
  String? dateAndTime;
  DateTime? startDateIso;
  DateTime? endDateIso;
  String? duration;
  String? endDate;
  String? timesToTake;
  // List<String>? formattedSelectedTimeAndPeriodList;
  String? note;
  List<int>? listOfTimes;
  dynamic dosageMap;
  bool? isCusSchedule;

  MedicationClass({
    this.medicationName,
    this.drugName,
    this.medicationType,
    this.medicationTypeIcon,
    this.description,
    this.medicationFile,
    this.dosage,
    this.dateAndTime,
    this.duration,
    // this.formattedSelectedTimeAndPeriodList,
    this.imageData,
    this.endDate,
    this.timesToTake,
    this.note,
    this.startDateIso,
    this.endDateIso,
    this.listOfTimes,
    this.dosageMap,
    this.isCusSchedule,
  });

  factory MedicationClass.fromJson(Map<String, dynamic> json) =>
      MedicationClass(
        medicationName: json['medicationName'] as String?,
        drugName: json['drugName'] as String?,
        medicationType: json['medicationType'] as String?,
        medicationTypeIcon: json['medicationTypeIcon'] as String?,
        dosage: json['dosage'] as String?,
        // formattedSelectedTimeAndPeriodList:json['formattedSelectedTimeAndPeriodList'],
        startDateIso: json['startDateTime'] == null
            ? null
            : DateTime.parse(json['startDateTime'] as String),
        endDateIso: json['endDateTime'] == null
            ? null
            : DateTime.parse(json['endDateTime'] as String),
        duration: json['durationInDays'],
        timesToTake: json['timesPerDay'] as String,
        dosageMap: (json['dailyDoseTimes'] as List<dynamic>?)
            ?.map(
              (e) => (e as List<dynamic>)
                  .map((e) => DailyDoseTime.fromJson(e as Map<String, dynamic>))
                  .toList(),
            )
            .toList(),
        note: json['note'] as String?,
        isCusSchedule: json['isCusSchedule'] as bool?,
        imageData: json['medicationImage'] == null
            ? null
            : Data.fromJson(json['medicationImage'] as Map<String, dynamic>),
      );

  Map<dynamic, dynamic> toJson() => {
    'medicationName': medicationName,
    'drugName': drugName,
    'medicationType': medicationType,
    'medicationTypeIcon': medicationTypeIcon,
    'dosage': dosage,
    'startDateTime': startDateIso,
    'endDateTime': endDateIso,
    'durationInDays': duration,
    'timesPerDay': timesToTake,
    'dailyDoseTimes': dosageMap,
    'isCusSchedule': isCusSchedule,
    // 'formattedSelectedTimeAndPeriodList':formattedSelectedTimeAndPeriodList,
    // 'dailyDoseTimes': dosageMap
    //     ?.map((e) => e.map((e) => e.toJson()).toList())
    //     .toList(),
    'note': note,
    'medicationImage': imageData?.toJson(),
  };
}
