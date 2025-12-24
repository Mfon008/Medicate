// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_business_owner_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBusinessOwnerProfileResponseModel
_$UpdateBusinessOwnerProfileResponseModelFromJson(Map<String, dynamic> json) =>
    UpdateBusinessOwnerProfileResponseModel(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateBusinessOwnerProfileResponseModelToJson(
  UpdateBusinessOwnerProfileResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
