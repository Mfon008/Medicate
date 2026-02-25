// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiate_payment_wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitiatePaymentWalletModel _$InitiatePaymentWalletModelFromJson(
  Map<String, dynamic> json,
) => InitiatePaymentWalletModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$InitiatePaymentWalletModelToJson(
  InitiatePaymentWalletModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
