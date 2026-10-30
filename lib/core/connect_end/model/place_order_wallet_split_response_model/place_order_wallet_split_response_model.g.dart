// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_wallet_split_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderWalletSplitResponseModel _$PlaceOrderWalletSplitResponseModelFromJson(
  Map<String, dynamic> json,
) => PlaceOrderWalletSplitResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PlaceOrderWalletSplitResponseModelToJson(
  PlaceOrderWalletSplitResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
