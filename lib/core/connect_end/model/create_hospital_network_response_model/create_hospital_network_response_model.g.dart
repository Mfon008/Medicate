// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_hospital_network_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateHospitalNetworkResponseModel _$CreateHospitalNetworkResponseModelFromJson(
  Map<String, dynamic> json,
) => CreateHospitalNetworkResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateHospitalNetworkResponseModelToJson(
  CreateHospitalNetworkResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
