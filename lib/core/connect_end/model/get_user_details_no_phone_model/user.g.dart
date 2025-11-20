// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  fullName: json['fullName'] as String?,
  phone: json['phone'] == null
      ? null
      : Phone.fromJson(json['phone'] as Map<String, dynamic>),
  email: json['email'] as String?,
  profilePicture: json['profilePicture'] == null
      ? null
      : ProfilePicture.fromJson(json['profilePicture'] as Map<String, dynamic>),
  pinSet: json['pinSet'] as bool?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'fullName': instance.fullName,
  'phone': instance.phone,
  'email': instance.email,
  'profilePicture': instance.profilePicture,
  'pinSet': instance.pinSet,
};
