// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Phone _$PhoneFromJson(Map<String, dynamic> json) => Phone(
  phoneNumber: json['phoneNumber'] as String?,
  isVerified: json['isVerified'] as bool?,
);

Map<String, dynamic> _$PhoneToJson(Phone instance) => <String, dynamic>{
  'phoneNumber': instance.phoneNumber,
  'isVerified': instance.isVerified,
};
