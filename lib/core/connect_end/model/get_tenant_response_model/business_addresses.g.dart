// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_addresses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessAddresses _$BusinessAddressesFromJson(Map<String, dynamic> json) =>
    BusinessAddresses(
      id: json['id'] as String?,
      businessAddress: json['businessAddress'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      lga: json['lga'] as String?,
      isActive: json['isActive'] as bool?,
      approvalStatus: json['approvalStatus'] as String?,
      submittedAt: json['submittedAt'] as String?,
      isPrimary: json['isPrimary'] as bool?,
    );

Map<String, dynamic> _$BusinessAddressesToJson(BusinessAddresses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'businessAddress': instance.businessAddress,
      'country': instance.country,
      'state': instance.state,
      'lga': instance.lga,
      'isActive': instance.isActive,
      'approvalStatus': instance.approvalStatus,
      'submittedAt': instance.submittedAt,
      'isPrimary': instance.isPrimary,
    };
