class UpdatePlanTiersEntityModel {
  String? name;
  String? primaryColor;
  String? secondaryColor;
  List<String>? features;

  UpdatePlanTiersEntityModel({
    this.name,
    this.primaryColor,
    this.secondaryColor,
    this.features,
  });

  factory UpdatePlanTiersEntityModel.fromJson(Map<String, dynamic> json) {
    return UpdatePlanTiersEntityModel(
      name: json['name'] as String?,
      primaryColor: json['primaryColor'] as String?,
      secondaryColor: json['secondaryColor'] as String?,
      features: json['features'] as List<String>?,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'primaryColor': primaryColor,
    'secondaryColor': secondaryColor,
    'features': features,
  };
}
