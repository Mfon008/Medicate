// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_healthcare_practitioner_kyc_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHealthcarePractitionerKycResponseModel
_$GetHealthcarePractitionerKycResponseModelFromJson(
  Map<String, dynamic> json,
) => GetHealthcarePractitionerKycResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetHealthcarePractitionerKycResponseModelToJson(
  GetHealthcarePractitionerKycResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
