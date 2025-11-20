// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
  address: json['address'] as String?,
  country: json['country'] as String?,
  dateOfBirth: json['dateOfBirth'] as String?,
  gender: json['gender'] as String?,
  heightCm: (json['heightCm'] as num?)?.toInt(),
  state: json['state'] as String?,
  weightKg: (json['weightKg'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'user': instance.user,
  'address': instance.address,
  'country': instance.country,
  'dateOfBirth': instance.dateOfBirth,
  'gender': instance.gender,
  'heightCm': instance.heightCm,
  'state': instance.state,
  'weightKg': instance.weightKg,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
