class SupportEntityModel {
  String? subjectType;
  String? description;

  SupportEntityModel({this.subjectType, this.description});

  factory SupportEntityModel.fromJson(Map<String, dynamic> json) {
    return SupportEntityModel(
      subjectType: json['subjectType'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'subjectType': subjectType,
    'description': description,
  };
}
