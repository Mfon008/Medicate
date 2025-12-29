// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'educational_experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationalExperience _$EducationalExperienceFromJson(
  Map<String, dynamic> json,
) => EducationalExperience(
  school: json['school'] as String?,
  degree: json['degree'] as String?,
  startMonth: json['startMonth'] as String?,
  startYear: (json['startYear'] as num?)?.toInt(),
  endMonth: json['endMonth'] as String?,
  endYear: (json['endYear'] as num?)?.toInt(),
);

Map<String, dynamic> _$EducationalExperienceToJson(
  EducationalExperience instance,
) => <String, dynamic>{
  'school': instance.school,
  'degree': instance.degree,
  'startMonth': instance.startMonth,
  'startYear': instance.startYear,
  'endMonth': instance.endMonth,
  'endYear': instance.endYear,
};
