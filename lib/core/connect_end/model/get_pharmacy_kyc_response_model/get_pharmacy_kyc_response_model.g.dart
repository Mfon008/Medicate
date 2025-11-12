// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pharmacy_kyc_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPharmacyKycResponseModel _$GetPharmacyKycResponseModelFromJson(
  Map<String, dynamic> json,
) => GetPharmacyKycResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetPharmacyKycResponseModelToJson(
  GetPharmacyKycResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
