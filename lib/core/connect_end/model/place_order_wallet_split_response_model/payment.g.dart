// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
  method: json['method'] as String?,
  status: json['status'] as String?,
  paymentId: json['paymentId'] as String?,
  transactionReference: json['transactionReference'] as String?,
  walletTransactionId: json['walletTransactionId'] as String?,
  newWalletBalance: json['newWalletBalance'] as String?,
  paidAt: json['paidAt'] == null
      ? null
      : DateTime.parse(json['paidAt'] as String),
);

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
  'method': instance.method,
  'status': instance.status,
  'paymentId': instance.paymentId,
  'transactionReference': instance.transactionReference,
  'walletTransactionId': instance.walletTransactionId,
  'newWalletBalance': instance.newWalletBalance,
  'paidAt': instance.paidAt?.toIso8601String(),
};
