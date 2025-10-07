// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  accessToken: json['accessToken'] as String?,
  refreshToken: json['refreshToken'] as String?,
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
  memberships: json['memberships'] as List<dynamic>?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
  'user': instance.user,
  'memberships': instance.memberships,
};
