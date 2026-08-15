// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDetails _$CategoryDetailsFromJson(Map<String, dynamic> json) =>
    CategoryDetails(
      id: json['id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      marginPercentage: (json['marginPercentage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CategoryDetailsToJson(CategoryDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'marginPercentage': instance.marginPercentage,
    };
