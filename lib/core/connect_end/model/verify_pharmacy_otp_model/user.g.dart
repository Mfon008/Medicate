// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String?,
  fullName: json['fullName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  profilePictureUrl: json['profilePictureUrl'] as String?,
  profileCompletionPercentage: (json['profileCompletionPercentage'] as num?)
      ?.toInt(),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'email': instance.email,
  'phone': instance.phone,
  'profilePictureUrl': instance.profilePictureUrl,
  'profileCompletionPercentage': instance.profileCompletionPercentage,
};
