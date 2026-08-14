// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  marginPercentage: (json['marginPercentage'] as num?)?.toInt(),
  isActive: json['isActive'] as bool?,
  isDeleted: json['isDeleted'] as bool?,
  createdByAdminId: json['createdByAdminId'] as String?,
  updatedByAdminId: json['updatedByAdminId'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  productCount: (json['productCount'] as num?)?.toInt(),
  productsCount: (json['productsCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'description': instance.description,
  'marginPercentage': instance.marginPercentage,
  'isActive': instance.isActive,
  'isDeleted': instance.isDeleted,
  'createdByAdminId': instance.createdByAdminId,
  'updatedByAdminId': instance.updatedByAdminId,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'productCount': instance.productCount,
  'productsCount': instance.productsCount,
};
