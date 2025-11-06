// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmacyLoginResponseModel _$PharmacyLoginResponseModelFromJson(
  Map<String, dynamic> json,
) => PharmacyLoginResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PharmacyLoginResponseModelToJson(
  PharmacyLoginResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
