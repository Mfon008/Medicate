// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_incoming_order_ddetails_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetIncomingOrderDdetailsResponseModel
_$GetIncomingOrderDdetailsResponseModelFromJson(Map<String, dynamic> json) =>
    GetIncomingOrderDdetailsResponseModel(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetIncomingOrderDdetailsResponseModelToJson(
  GetIncomingOrderDdetailsResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
