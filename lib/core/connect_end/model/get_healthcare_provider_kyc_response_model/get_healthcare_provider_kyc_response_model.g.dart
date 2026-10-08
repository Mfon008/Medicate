// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_healthcare_provider_kyc_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHealthcareProviderKycResponseModel
_$GetHealthcareProviderKycResponseModelFromJson(Map<String, dynamic> json) =>
    GetHealthcareProviderKycResponseModel(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetHealthcareProviderKycResponseModelToJson(
  GetHealthcareProviderKycResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
