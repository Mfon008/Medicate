// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
  transactionReference: json['transactionReference'] as String?,
  amount: (json['amount'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  status: json['status'] as String?,
  reminderGroupId: json['reminderGroupId'] as String?,
  notificationChannelsPaidFor:
      (json['notificationChannelsPaidFor'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  priceBreakdown: (json['priceBreakdown'] as List<dynamic>?)
      ?.map((e) => PriceBreakdown.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
  'transactionReference': instance.transactionReference,
  'amount': instance.amount,
  'currency': instance.currency,
  'status': instance.status,
  'reminderGroupId': instance.reminderGroupId,
  'notificationChannelsPaidFor': instance.notificationChannelsPaidFor,
  'priceBreakdown': instance.priceBreakdown,
};
