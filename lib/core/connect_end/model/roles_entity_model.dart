class RolesEntityModel {
  String? name;
  String? description;

  RolesEntityModel({this.name, this.description});

  factory RolesEntityModel.fromJson(Map<String, dynamic> json) {
    return RolesEntityModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'name': name, 'description': description};
}
