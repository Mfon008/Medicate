// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_with_wallet_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayWithWalletResponseModel _$PayWithWalletResponseModelFromJson(
  Map<String, dynamic> json,
) => PayWithWalletResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PayWithWalletResponseModelToJson(
  PayWithWalletResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
