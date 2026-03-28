import 'plan_specific.dart';

class SaveSecondFamStepEntityModel {
  String? applicationId;
  int? step;
  PlanSpecific? planSpecific;

  SaveSecondFamStepEntityModel({
    this.applicationId,
    this.step,
    this.planSpecific,
  });

  factory SaveSecondFamStepEntityModel.fromJson(Map<String, dynamic> json) {
    return SaveSecondFamStepEntityModel(
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
