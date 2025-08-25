// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserDetailsResponseModel _$GetUserDetailsResponseModelFromJson(
  Map<String, dynamic> json,
) => GetUserDetailsResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetUserDetailsResponseModelToJson(
  GetUserDetailsResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'statusCode': instance.statusCode,
  'data': instance.data,
};
