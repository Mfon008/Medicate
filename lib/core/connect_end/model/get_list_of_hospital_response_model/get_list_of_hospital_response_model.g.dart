// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_list_of_hospital_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetListOfHospitalResponseModel _$GetListOfHospitalResponseModelFromJson(
  Map<String, dynamic> json,
) => GetListOfHospitalResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetListOfHospitalResponseModelToJson(
  GetListOfHospitalResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
