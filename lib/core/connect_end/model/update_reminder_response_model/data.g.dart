// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  message: json['message'] as String?,
  transactionReference: json['transactionReference'] as String?,
  paymentId: json['paymentId'] as String?,
  data: json['data'],
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'message': instance.message,
  'transactionReference': instance.transactionReference,
  'paymentId': instance.paymentId,
  'data': instance.data,
};
