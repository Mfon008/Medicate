// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_destination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryDestination _$DeliveryDestinationFromJson(Map<String, dynamic> json) =>
    DeliveryDestination(
      stateCode: json['stateCode'] as String?,
      stateName: json['stateName'] as String?,
      lgaCode: json['lgaCode'] as String?,
      lgaName: json['lgaName'] as String?,
    );

Map<String, dynamic> _$DeliveryDestinationToJson(
  DeliveryDestination instance,
) => <String, dynamic>{
  'stateCode': instance.stateCode,
  'stateName': instance.stateName,
  'lgaCode': instance.lgaCode,
  'lgaName': instance.lgaName,
};
