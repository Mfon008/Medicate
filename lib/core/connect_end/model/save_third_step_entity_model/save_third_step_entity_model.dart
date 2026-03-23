import 'document.dart';

class SaveThirdStepEntityModel {
  String? applicationId;
  int? step;
  List<Document>? documents;

  SaveThirdStepEntityModel({this.applicationId, this.step, this.documents});

  factory SaveThirdStepEntityModel.fromJson(Map<String, dynamic> json) {
    return SaveThirdStepEntityModel(
      applicationId: json['applicationId'] as String?,
      step: json['step'] as int?,
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'applicationId': applicationId,
    'step': step,
    'documents': documents?.map((e) => e.toJson()).toList(),
  };
}
