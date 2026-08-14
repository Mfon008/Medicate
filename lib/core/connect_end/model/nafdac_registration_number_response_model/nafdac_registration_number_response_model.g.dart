// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nafdac_registration_number_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NafdacRegistrationNumberResponseModel
_$NafdacRegistrationNumberResponseModelFromJson(Map<String, dynamic> json) =>
    NafdacRegistrationNumberResponseModel(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NafdacRegistrationNumberResponseModelToJson(
  NafdacRegistrationNumberResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
