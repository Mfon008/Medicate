import 'dart:io';

class MedicationClass {
  String? medicationName;
  String? drugName;
  String? medicationType;
  String? medicationTypeIcon;
  String? description;
  File? medicationFile;
  String? dosage;
  String? dateAndTime;
  String? duration;
  String? endDate;
  String? timesToTake;
  String? note;
  List<int>? listOfTimes;
  List<List<dynamic>>? dosageMap;

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
    this.endDate,
    this.timesToTake,
    this.note,
    this.listOfTimes,
    this.dosageMap
  });
}
