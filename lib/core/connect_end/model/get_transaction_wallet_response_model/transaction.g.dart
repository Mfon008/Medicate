// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
  id: json['id'] as String?,
  amount: json['amount'] as String?,
  type: json['type'] as String?,
  reference: json['reference'] as String?,
  description: json['description'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'type': instance.type,
      'reference': instance.reference,
      'description': instance.description,
      'createdAt': instance.createdAt,
    };
