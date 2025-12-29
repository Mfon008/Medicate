import 'package:json_annotation/json_annotation.dart';

part 'educational_experience.g.dart';

@JsonSerializable()
class EducationalExperience {
  String? school;
  String? degree;
  String? startMonth;
  int? startYear;
  String? endMonth;
  int? endYear;

  EducationalExperience({
    this.school,
    this.degree,
    this.startMonth,
    this.startYear,
    this.endMonth,
    this.endYear,
  });

  factory EducationalExperience.fromJson(Map<String, dynamic> json) {
    return _$EducationalExperienceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EducationalExperienceToJson(this);
}
