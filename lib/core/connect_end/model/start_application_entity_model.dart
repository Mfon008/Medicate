class StartApplicationEntityModel {
  String? hmoId;
  String? planId;
  String? planType;

  StartApplicationEntityModel({this.hmoId, this.planId, this.planType});

  factory StartApplicationEntityModel.fromJson(Map<String, dynamic> json) {
    return StartApplicationEntityModel(
      hmoId: json['hmoId'] as String?,
      planId: json['planId'] as String?,
      planType: json['planType'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'hmoId': hmoId,
    'planId': planId,
    'planType': planType,
  };
}
