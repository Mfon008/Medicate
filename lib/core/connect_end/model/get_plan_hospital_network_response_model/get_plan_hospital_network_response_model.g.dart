// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_plan_hospital_network_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPlanHospitalNetworkResponseModel
_$GetPlanHospitalNetworkResponseModelFromJson(Map<String, dynamic> json) =>
    GetPlanHospitalNetworkResponseModel(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetPlanHospitalNetworkResponseModelToJson(
  GetPlanHospitalNetworkResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
