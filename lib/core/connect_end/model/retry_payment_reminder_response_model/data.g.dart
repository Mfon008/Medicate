// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  reminderId: json['reminderId'] as String?,
  reminderGroupId: json['reminderGroupId'] as String?,
  transactionReference: json['transactionReference'] as String?,
  currency: json['currency'] as String?,
  totalAmount: (json['totalAmount'] as num?)?.toInt(),
  status: json['status'] as String?,
  retryChannels: (json['retryChannels'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  breakdown: (json['breakdown'] as List<dynamic>?)
      ?.map((e) => Breakdown.fromJson(e as Map<String, dynamic>))
      .toList(),
  resumed: json['resumed'] as bool?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'reminderId': instance.reminderId,
  'reminderGroupId': instance.reminderGroupId,
  'transactionReference': instance.transactionReference,
  'currency': instance.currency,
  'totalAmount': instance.totalAmount,
  'status': instance.status,
  'retryChannels': instance.retryChannels,
  'breakdown': instance.breakdown,
  'resumed': instance.resumed,
};
