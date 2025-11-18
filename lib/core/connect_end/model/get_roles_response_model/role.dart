import 'package:json_annotation/json_annotation.dart';

part 'role.g.dart';

@JsonSerializable()
class Role {
  String? id;
  String? name;
  String? description;
  List<String>? permissions;
  bool? isDefault;

  Role({
    this.id,
    this.name,
    this.description,
    this.permissions,
    this.isDefault,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
