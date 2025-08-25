// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_pin_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePinResponseModel _$ChangePinResponseModelFromJson(
  Map<String, dynamic> json,
) => ChangePinResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ChangePinResponseModelToJson(
  ChangePinResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'statusCode': instance.statusCode,
  'data': instance.data,
};
