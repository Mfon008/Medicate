// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_dose_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyDoseTime _$DailyDoseTimeFromJson(Map<String, dynamic> json) =>
    DailyDoseTime(
      time: json['time'] as String?,
      date: json['date'] as String?,
      isoDate: json['isoDate'] == null
          ? null
          : DateTime.parse(json['isoDate'] as String),
    );

Map<String, dynamic> _$DailyDoseTimeToJson(DailyDoseTime instance) =>
    <String, dynamic>{
      'time': instance.time,
      'date': instance.date,
      'isoDate': instance.isoDate?.toIso8601String(),
    };
