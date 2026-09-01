// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_checkout_delivery_option_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCheckoutDeliveryOptionResponseModel
_$GetCheckoutDeliveryOptionResponseModelFromJson(Map<String, dynamic> json) =>
    GetCheckoutDeliveryOptionResponseModel(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCheckoutDeliveryOptionResponseModelToJson(
  GetCheckoutDeliveryOptionResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
