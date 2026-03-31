import 'plan_specific.dart';

class SaveSecondCorpEntityModel {
  String? applicationId;
  int? step;
  PlanSpecific? planSpecific;

  SaveSecondCorpEntityModel({this.applicationId, this.step, this.planSpecific});

  factory SaveSecondCorpEntityModel.fromJson(Map<String, dynamic> json) {
    return SaveSecondCorpEntityModel(
      applicationId: json['applicationId'] as String?,
      step: json['step'] as int?,
      planSpecific: json['planSpecific'] == null
          ? null
          : PlanSpecific.fromJson(json['planSpecific'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'applicationId': applicationId,
    'step': step,
    'planSpecific': planSpecific?.toJson(),
  };
}
