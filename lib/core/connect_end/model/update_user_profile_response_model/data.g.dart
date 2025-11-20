// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  id: json['id'] as String?,
  fullName: json['fullName'] as String?,
  email: json['email'] as String?,
  dateOfBirth: json['dateOfBirth'] as String?,
  gender: json['gender'] as String?,
  age: (json['age'] as num?)?.toInt(),
  country: json['country'] as String?,
  height: (json['height'] as num?)?.toInt(),
  weight: (json['weight'] as num?)?.toInt(),
  profileCompletion: (json['profileCompletion'] as num?)?.toInt(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'email': instance.email,
  'dateOfBirth': instance.dateOfBirth,
  'gender': instance.gender,
  'age': instance.age,
  'country': instance.country,
  'height': instance.height,
  'weight': instance.weight,
  'profileCompletion': instance.profileCompletion,
};
