// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_bank_change.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingBankChange _$PendingBankChangeFromJson(Map<String, dynamic> json) =>
    PendingBankChange(
      id: json['id'] as String?,
      bankName: json['bankName'] as String?,
      accountName: json['accountName'] as String?,
      accountNumber: json['accountNumber'] as String?,
      status: json['status'] as String?,
      submittedAt: json['submittedAt'] == null
          ? null
          : DateTime.parse(json['submittedAt'] as String),
    );

Map<String, dynamic> _$PendingBankChangeToJson(PendingBankChange instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bankName': instance.bankName,
      'accountName': instance.accountName,
      'accountNumber': instance.accountNumber,
      'status': instance.status,
      'submittedAt': instance.submittedAt?.toIso8601String(),
    };
