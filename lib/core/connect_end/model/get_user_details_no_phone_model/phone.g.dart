// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Phone _$PhoneFromJson(Map<String, dynamic> json) => Phone(
  number: json['number'] as String?,
  isVerified: json['isVerified'] as bool?,
);

Map<String, dynamic> _$PhoneToJson(Phone instance) => <String, dynamic>{
  'number': instance.number,
  'isVerified': instance.isVerified,
};
