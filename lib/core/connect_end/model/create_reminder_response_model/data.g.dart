// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  message: json['message'] as String?,
  reminderGroupId: json['reminderGroupId'] as String?,
  transactionReference: json['transactionReference'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'message': instance.message,
  'reminderGroupId': instance.reminderGroupId,
  'transactionReference': instance.transactionReference,
};
