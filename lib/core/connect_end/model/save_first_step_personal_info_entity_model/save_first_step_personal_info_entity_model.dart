import 'personal_info.dart';

class SaveFirstStepPersonalInfoEntityModel {
  String? applicationId;
  int? step;
  PersonalInfo? personalInfo;

  SaveFirstStepPersonalInfoEntityModel({
    this.applicationId,
    this.step,
    this.personalInfo,
  });

  factory SaveFirstStepPersonalInfoEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return SaveFirstStepPersonalInfoEntityModel(
      applicationId: json['applicationId'] as String?,
      step: json['step'] as int?,
      personalInfo: json['personalInfo'] == null
          ? null
          : PersonalInfo.fromJson(json['personalInfo'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'applicationId': applicationId,
    'step': step,
    'personalInfo': personalInfo?.toJson(),
  };
}
