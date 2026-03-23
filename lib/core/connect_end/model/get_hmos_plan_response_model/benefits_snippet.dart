class BenefitsSnippet {
  String? description;
  String? coverageLimit;

  BenefitsSnippet({this.description, this.coverageLimit});

  BenefitsSnippet.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    coverageLimit = json['coverageLimit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['coverageLimit'] = coverageLimit;
    return data;
  }
}
