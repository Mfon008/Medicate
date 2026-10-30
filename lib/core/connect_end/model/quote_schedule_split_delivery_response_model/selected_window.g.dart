// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_window.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectedWindow _$SelectedWindowFromJson(Map<String, dynamic> json) =>
    SelectedWindow(
      deliveryDate: json['deliveryDate'] as String?,
      timeBlockStart: json['timeBlockStart'] as String?,
      timeBlockEnd: json['timeBlockEnd'] as String?,
      timeWindowLabel: json['timeWindowLabel'] as String?,
    );

Map<String, dynamic> _$SelectedWindowToJson(SelectedWindow instance) =>
    <String, dynamic>{
      'deliveryDate': instance.deliveryDate,
      'timeBlockStart': instance.timeBlockStart,
      'timeBlockEnd': instance.timeBlockEnd,
      'timeWindowLabel': instance.timeWindowLabel,
    };
