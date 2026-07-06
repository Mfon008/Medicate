// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medication _$MedicationFromJson(Map<String, dynamic> json) => Medication(
  medicationName: json['medicationName'] as String?,
  medicationType: json['medicationType'] as String?,
  dosage: json['dosage'] as String?,
  startDateTime: json['startDateTime'],
  durationInDays: json['durationInDays'],
  endDateTime: json['endDateTime'],
  timesPerDay: json['timesPerDay'],
  scheduleType: json['scheduleType'],
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

Map<String, dynamic> _$MedicationToJson(Medication instance) =>
    <String, dynamic>{
      'medicationName': instance.medicationName,
      'medicationType': instance.medicationType,
      'medicationImage': instance.medicationImage,
      'dosage': instance.dosage,
      'startDateTime': instance.startDateTime,
      'durationInDays': instance.durationInDays,
      'endDateTime': instance.endDateTime,
      'timesPerDay': instance.timesPerDay,
      'scheduleType': instance.scheduleType,
      'dailyDoseTimes': instance.dailyDoseTimes,
      'note': instance.note,
    };
