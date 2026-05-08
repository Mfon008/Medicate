class Benefit {
  String? description;
  String? coverageLimit;

  Benefit({this.description, this.coverageLimit});

  factory Benefit.fromJson(Map<String, dynamic> json) => Benefit(
    description: json['description'] as String?,
    coverageLimit: json['coverageLimit'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'description': description,
    'coverageLimit': coverageLimit,
  };
}
