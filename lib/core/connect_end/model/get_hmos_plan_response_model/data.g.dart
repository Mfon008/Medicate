// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  hmo: json['hmo'] == null
      ? null
      : Hmo.fromJson(json['hmo'] as Map<String, dynamic>),
  plans: (json['plans'] as List<dynamic>?)
      ?.map((e) => Plan.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : Meta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'hmo': instance.hmo,
  'plans': instance.plans,
  'meta': instance.meta,
};
