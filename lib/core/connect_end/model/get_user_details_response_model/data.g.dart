// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  displayName: json['fullName'] as String?,
  phone: json['phone'] as String?,
  pinSet: json['pinSet'] as bool?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'fullName': instance.displayName,
  'phone': instance.phone,
  'pinSet': instance.pinSet,
};
