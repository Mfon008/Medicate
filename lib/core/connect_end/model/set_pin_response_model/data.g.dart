// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  id: json['id'] as String?,
  displayName: json['displayName'] as String?,
  phone: json['phone'] == null
      ? null
      : Phone.fromJson(json['phone'] as Map<String, dynamic>),
  tokens: json['tokens'] == null
      ? null
      : Tokens.fromJson(json['tokens'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'id': instance.id,
  'displayName': instance.displayName,
  'phone': instance.phone,
  'tokens': instance.tokens,
};
