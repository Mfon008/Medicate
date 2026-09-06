// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_incoming_orders_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListIncomingOrdersResponseModel _$ListIncomingOrdersResponseModelFromJson(
  Map<String, dynamic> json,
) => ListIncomingOrdersResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ListIncomingOrdersResponseModelToJson(
  ListIncomingOrdersResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
