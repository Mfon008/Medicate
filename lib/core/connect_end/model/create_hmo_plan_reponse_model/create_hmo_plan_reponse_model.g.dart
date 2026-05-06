// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_hmo_plan_reponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateHmoPlanReponseModel _$CreateHmoPlanReponseModelFromJson(
  Map<String, dynamic> json,
) => CreateHmoPlanReponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateHmoPlanReponseModelToJson(
  CreateHmoPlanReponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
