// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Method _$MethodFromJson(Map<String, dynamic> json) => Method(
  method: json['method'] as String?,
  available: json['available'] as bool?,
  deliveryFee: (json['deliveryFee'] as num?)?.toInt(),
  unavailableReasons: json['unavailableReasons'] as List<dynamic>?,
  minimumLeadTimeDays: (json['minimumLeadTimeDays'] as num?)?.toInt(),
  availableDeliveryDays: (json['availableDeliveryDays'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  timeBlocks: (json['timeBlocks'] as List<dynamic>?)
      ?.map((e) => TimeBlock.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MethodToJson(Method instance) => <String, dynamic>{
  'method': instance.method,
  'available': instance.available,
  'deliveryFee': instance.deliveryFee,
  'unavailableReasons': instance.unavailableReasons,
  'minimumLeadTimeDays': instance.minimumLeadTimeDays,
  'availableDeliveryDays': instance.availableDeliveryDays,
  'timeBlocks': instance.timeBlocks,
};
