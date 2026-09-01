// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Destination _$DestinationFromJson(Map<String, dynamic> json) => Destination(
  stateCode: json['stateCode'] as String?,
  stateName: json['stateName'] as String?,
  lgaCode: json['lgaCode'] as String?,
  lgaName: json['lgaName'] as String?,
);

Map<String, dynamic> _$DestinationToJson(Destination instance) =>
    <String, dynamic>{
      'stateCode': instance.stateCode,
      'stateName': instance.stateName,
      'lgaCode': instance.lgaCode,
      'lgaName': instance.lgaName,
    };
