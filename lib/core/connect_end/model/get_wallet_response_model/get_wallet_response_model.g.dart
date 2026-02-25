// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_wallet_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWalletResponseModel _$GetWalletResponseModelFromJson(
  Map<String, dynamic> json,
) => GetWalletResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetWalletResponseModelToJson(
  GetWalletResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
