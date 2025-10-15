// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
  id: json['_id'] as String?,
  medicationType: json['medicationType'] as String?,
  drugName: json['drugName'] as String?,
  time: json['time'] as String?,
  date: json['date'] as String?,
  status: json['status'] as String?,
  note: json['note'] as String?,
  doseId: json['doseId'] as String?,
  reminderId: json['reminderId'] as String?,
);

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
  '_id': instance.id,
  'medicationType': instance.medicationType,
  'drugName': instance.drugName,
  'time': instance.time,
  'date': instance.date,
  'status': instance.status,
  'note': instance.note,
  'doseId': instance.doseId,
  'reminderId': instance.reminderId,
};
