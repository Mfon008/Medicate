// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
  gender: json['gender'] as String?,
  country: json['country'] as String?,
  state: json['state'] as String?,
  address: json['address'] as String?,
);

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
  'gender': instance.gender,
  'country': instance.country,
  'state': instance.state,
  'address': instance.address,
};
