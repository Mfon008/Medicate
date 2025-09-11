// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
  id: json['_id'] as String?,
  fullName: json['fullName'] as String?,
  email: json['email'],
  dateOfBirth: json['dateOfBirth'],
  gender: json['gender'],
  age: json['age'],
  country: json['country'],
  height: json['height'],
  weight: json['weight'],
  profilePicture: json['profilePicture'] == null
      ? null
      : ProfilePicture.fromJson(json['profilePicture'] as Map<String, dynamic>),
  profileCompletion: (json['profileCompletion'] as num?)?.toInt(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
  '_id': instance.id,
  'fullName': instance.fullName,
  'email': instance.email,
  'dateOfBirth': instance.dateOfBirth,
  'gender': instance.gender,
  'age': instance.age,
  'country': instance.country,
  'height': instance.height,
  'weight': instance.weight,
  'profilePicture': instance.profilePicture,
  'profileCompletion': instance.profileCompletion,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
