// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  transactionReference: json['transactionReference'] as String?,
  status: json['status'] as String?,
  walletTransactionId: json['walletTransactionId'] as String?,
  newWalletBalance: json['newWalletBalance'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'transactionReference': instance.transactionReference,
  'status': instance.status,
  'walletTransactionId': instance.walletTransactionId,
  'newWalletBalance': instance.newWalletBalance,
};
