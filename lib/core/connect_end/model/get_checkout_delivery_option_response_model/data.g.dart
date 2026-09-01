// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  destination: json['destination'] == null
      ? null
      : Destination.fromJson(json['destination'] as Map<String, dynamic>),
  available: json['available'] as bool?,
  methods: (json['methods'] as List<dynamic>?)
      ?.map((e) => Method.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'destination': instance.destination,
  'available': instance.available,
  'methods': instance.methods,
};
