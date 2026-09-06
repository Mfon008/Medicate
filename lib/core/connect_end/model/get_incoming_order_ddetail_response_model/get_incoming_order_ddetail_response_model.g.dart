// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_incoming_order_ddetail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetIncomingOrderDdetailResponseModel
_$GetIncomingOrderDdetailResponseModelFromJson(Map<String, dynamic> json) =>
    GetIncomingOrderDdetailResponseModel(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetIncomingOrderDdetailResponseModelToJson(
  GetIncomingOrderDdetailResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
