// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  message: json['message'] as String?,
  transactionReference: json['transactionReference'] as String?,
  data: json['data'],
  paymentId: json['paymentId'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'message': instance.message,
  'transactionReference': instance.transactionReference,
  'paymentId': instance.paymentId,
  'data': instance.data,
};
