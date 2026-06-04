// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  summary: json['summary'] == null
      ? null
      : Summary.fromJson(json['summary'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : Meta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'items': instance.items,
  'summary': instance.summary,
  'meta': instance.meta,
};
