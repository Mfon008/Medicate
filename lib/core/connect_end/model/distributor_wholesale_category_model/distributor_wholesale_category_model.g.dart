// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distributor_wholesale_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistributorWholesaleCategoryModel _$DistributorWholesaleCategoryModelFromJson(
  Map<String, dynamic> json,
) => DistributorWholesaleCategoryModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DistributorWholesaleCategoryModelToJson(
  DistributorWholesaleCategoryModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
