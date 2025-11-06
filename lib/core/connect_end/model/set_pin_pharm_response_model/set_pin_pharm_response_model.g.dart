// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_pin_pharm_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetPinPharmResponseModel _$SetPinPharmResponseModelFromJson(
  Map<String, dynamic> json,
) => SetPinPharmResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SetPinPharmResponseModelToJson(
  SetPinPharmResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
