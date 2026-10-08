// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankInformation _$BankInformationFromJson(Map<String, dynamic> json) =>
    BankInformation(
      bankName: json['bankName'] as String?,
      accountName: json['accountName'] as String?,
      accountNumber: json['accountNumber'] as String?,
    );

Map<String, dynamic> _$BankInformationToJson(BankInformation instance) =>
    <String, dynamic>{
      'bankName': instance.bankName,
      'accountName': instance.accountName,
      'accountNumber': instance.accountNumber,
    };
