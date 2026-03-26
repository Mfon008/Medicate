// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_hmo_plan_hospital_network_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHmoPlanHospitalNetworkResponseModel
_$GetHmoPlanHospitalNetworkResponseModelFromJson(Map<String, dynamic> json) =>
    GetHmoPlanHospitalNetworkResponseModel(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetHmoPlanHospitalNetworkResponseModelToJson(
  GetHmoPlanHospitalNetworkResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
