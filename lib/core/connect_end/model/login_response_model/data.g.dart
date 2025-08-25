// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  id: json['_id'] as String?,
  userType: json['userType'] as String?,
  phone: json['phone'] == null
      ? null
      : Phone.fromJson(json['phone'] as Map<String, dynamic>),
  displayName: json['displayName'] as String?,
  pinSet: json['pinSet'] as bool?,
  profile: json['profile'] == null
      ? null
      : Profile.fromJson(json['profile'] as Map<String, dynamic>),
  profileType: json['profileType'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  tokens: json['tokens'] == null
      ? null
      : Tokens.fromJson(json['tokens'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  '_id': instance.id,
  'userType': instance.userType,
  'phone': instance.phone,
  'displayName': instance.displayName,
  'pinSet': instance.pinSet,
  'profile': instance.profile,
  'profileType': instance.profileType,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'tokens': instance.tokens,
};
