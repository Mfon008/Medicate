// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medication _$MedicationFromJson(Map<String, dynamic> json) => Medication(
  medicationName: json['medicationName'] as String?,
  drugName: json['drugName'] as String?,
  medicationType: json['medicationType'] as String?,
  dosage: json['dosage'] as String?,
  scheduleType:json['scheduleType'] as String,
  startDateTime: json['startDateTime'] == null
      ? null
      : DateTime.parse(json['startDateTime'] as String),
  durationInDays: (json['durationInDays'] as num?)?.toInt(),
  endDateTime: json['endDateTime'] == null
      ? null
      : DateTime.parse(json['endDateTime'] as String),
  timesPerDay: (json['timesPerDay'] as num?)?.toInt(),
  note: json['note'] as String?,
  dailyDoseTimes: (json['dailyDoseTimes'] as List<dynamic>?)
      ?.map(
        (e) => (e as List<dynamic>)
            .map((e) => DailyDoseTime.fromJson(e as Map<String, dynamic>))
            .toList(),
      )
      .toList(),
  medicationStatus: json['medicationStatus'] as String?,
  medicationImage: json['medicationImage'] == null
      ? null
      : MedicationImage.fromJson(
          json['medicationImage'] as Map<String, dynamic>,
        ),
  id: json['_id'] as String?,
);

Map<String, dynamic> _$MedicationToJson(Medication instance) =>
    <String, dynamic>{
      'medicationName': instance.medicationName,
      'drugName': instance.drugName,
      'medicationType': instance.medicationType,
      'dosage': instance.dosage,
      'scheduleType':instance.scheduleType,
      'startDateTime': instance.startDateTime?.toIso8601String(),
      'durationInDays': instance.durationInDays,
      'endDateTime': instance.endDateTime?.toIso8601String(),
      'timesPerDay': instance.timesPerDay,
      'note': instance.note,
      'dailyDoseTimes': instance.dailyDoseTimes,
      'medicationStatus': instance.medicationStatus,
      'medicationImage': instance.medicationImage,
      '_id': instance.id,
    };
