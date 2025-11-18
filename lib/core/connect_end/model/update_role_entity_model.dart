class UpdateRoleEntityModel {
  String? roleId;
  String? name;
  String? description;
  List<String>? permissions;

  UpdateRoleEntityModel({
    this.roleId,
    this.name,
    this.description,
    this.permissions,
  });

  factory UpdateRoleEntityModel.fromJson(Map<String, dynamic> json) {
    return UpdateRoleEntityModel(
      roleId: json['roleId'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      permissions: json['permissions'] as List<String>?,
    );
  }

  Map<String, dynamic> toJson() => {
    'roleId': roleId,
    'name': name,
    'description': description,
    'permissions': permissions,
  };
}
