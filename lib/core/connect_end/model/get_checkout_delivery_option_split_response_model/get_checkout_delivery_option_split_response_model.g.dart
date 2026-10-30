// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_checkout_delivery_option_split_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCheckoutDeliveryOptionSplitResponseModel
_$GetCheckoutDeliveryOptionSplitResponseModelFromJson(
  Map<String, dynamic> json,
) => GetCheckoutDeliveryOptionSplitResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetCheckoutDeliveryOptionSplitResponseModelToJson(
  GetCheckoutDeliveryOptionSplitResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
