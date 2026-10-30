// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  splitOrder: json['splitOrder'] as bool?,
  available: json['available'] as bool?,
  deliveries: (json['deliveries'] as List<dynamic>?)
      ?.map((e) => Delivery.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'splitOrder': instance.splitOrder,
  'available': instance.available,
  'deliveries': instance.deliveries,
};
