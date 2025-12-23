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
    return EducationalExperience(
      school: json['school'] as String?,
      degree: json['degree'] as String?,
      startMonth: json['startMonth'] as String?,
      startYear: json['startYear'] as int?,
      endMonth: json['endMonth'] as String?,
      endYear: json['endYear'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'school': school,
    'degree': degree,
    'startMonth': startMonth,
    'startYear': startYear,
    'endMonth': endMonth,
    'endYear': endYear,
  };
}
