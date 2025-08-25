// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_pin_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetPinResponseModel _$SetPinResponseModelFromJson(Map<String, dynamic> json) =>
    SetPinResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SetPinResponseModelToJson(
  SetPinResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'statusCode': instance.statusCode,
  'data': instance.data,
};
