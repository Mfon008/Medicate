// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeBlock _$TimeBlockFromJson(Map<String, dynamic> json) => TimeBlock(
  id: json['id'] as String?,
  name: json['name'] as String?,
  startTime: json['startTime'] as String?,
  endTime: json['endTime'] as String?,
  maxOrders: (json['maxOrders'] as num?)?.toInt(),
  remainingCapacity: (json['remainingCapacity'] as num?)?.toInt(),
);

Map<String, dynamic> _$TimeBlockToJson(TimeBlock instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'maxOrders': instance.maxOrders,
  'remainingCapacity': instance.remainingCapacity,
};
