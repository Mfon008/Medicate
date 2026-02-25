// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_payment_wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePaymentWalletModel _$CreatePaymentWalletModelFromJson(
  Map<String, dynamic> json,
) => CreatePaymentWalletModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreatePaymentWalletModelToJson(
  CreatePaymentWalletModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
