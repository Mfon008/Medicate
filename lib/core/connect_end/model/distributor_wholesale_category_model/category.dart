import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? slug;
  String? description;
  int? marginPercentage;
  bool? isActive;
  bool? isDeleted;
  String? createdByAdminId;
  String? updatedByAdminId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? productCount;
  int? productsCount;

  Category({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.marginPercentage,
    this.isActive,
    this.isDeleted,
    this.createdByAdminId,
    this.updatedByAdminId,
    this.createdAt,
    this.updatedAt,
    this.productCount,
    this.productsCount,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
