// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) => History(
  action: json['action'] as String?,
  status: json['status'] as String?,
  occurredAt: json['occurredAt'] == null
      ? null
      : DateTime.parse(json['occurredAt'] as String),
  generation: (json['generation'] as num?)?.toInt(),
  actorId: json['actorId'] as String?,
  actorType: json['actorType'] as String?,
  deliveryId: json['deliveryId'] as String?,
  requestId: json['requestId'] as String?,
);

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
  'action': instance.action,
  'status': instance.status,
  'occurredAt': instance.occurredAt?.toIso8601String(),
  'generation': instance.generation,
  'actorId': instance.actorId,
  'actorType': instance.actorType,
  'deliveryId': instance.deliveryId,
  'requestId': instance.requestId,
};
