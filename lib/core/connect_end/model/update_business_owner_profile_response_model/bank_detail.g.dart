// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankDetail _$BankDetailFromJson(Map<String, dynamic> json) => BankDetail(
  accountName: json['accountName'] as String?,
  bankName: json['bankName'] as String?,
  accountNumber: json['accountNumber'] as String?,
);

Map<String, dynamic> _$BankDetailToJson(BankDetail instance) =>
    <String, dynamic>{
      'accountName': instance.accountName,
      'bankName': instance.bankName,
      'accountNumber': instance.accountNumber,
    };
