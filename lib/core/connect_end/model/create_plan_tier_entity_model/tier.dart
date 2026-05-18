class Tier {
  String? name;
  String? primaryColor;
  String? secondaryColor;
  List<String>? features;

  Tier({this.name, this.primaryColor, this.secondaryColor, this.features});

  factory Tier.fromJson(Map<String, dynamic> json) => Tier(
    name: json['name'] as String?,
    primaryColor: json['primaryColor'] as String?,
    secondaryColor: json['secondaryColor'] as String?,
    features: json['features'] as List<String>?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'primaryColor': primaryColor,
    'secondaryColor': secondaryColor,
    'features': features,
  };
}
