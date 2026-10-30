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
);

Map<String, dynamic> _$MethodToJson(Method instance) => <String, dynamic>{
  'method': instance.method,
  'available': instance.available,
  'deliveryFee': instance.deliveryFee,
  'unavailableReasons': instance.unavailableReasons,
};
