// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankDetails _$BankDetailsFromJson(Map<String, dynamic> json) => BankDetails(
  bankName: json['bankName'] as String?,
  accountName: json['accountName'] as String?,
  accountNumber: json['accountNumber'] as String?,
);

Map<String, dynamic> _$BankDetailsToJson(BankDetails instance) =>
    <String, dynamic>{
      'bankName': instance.bankName,
      'accountName': instance.accountName,
      'accountNumber': instance.accountNumber,
    };
