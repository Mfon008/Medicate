// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_individual_application_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetIndividualApplicationDetailsModel
_$GetIndividualApplicationDetailsModelFromJson(Map<String, dynamic> json) =>
    GetIndividualApplicationDetailsModel(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetIndividualApplicationDetailsModelToJson(
  GetIndividualApplicationDetailsModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
