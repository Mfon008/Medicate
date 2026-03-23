import 'plan_specific.dart';

class SaveSecondStepEntityModel {
  String? applicationId;
  int? step;
  PlanSpecific? planSpecific;

  SaveSecondStepEntityModel({this.applicationId, this.step, this.planSpecific});

  factory SaveSecondStepEntityModel.fromJson(Map<String, dynamic> json) {
    return SaveSecondStepEntityModel(
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
