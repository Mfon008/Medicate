// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessAddress _$BusinessAddressFromJson(Map<String, dynamic> json) =>
    BusinessAddress(
      id: json['id'] as String?,
      businessAddress: json['businessAddress'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      lga: json['lga'] as String?,
      isActive: json['isActive'] as bool?,
      approvalStatus: json['approvalStatus'] as String?,
      submittedAt: json['submittedAt'],
      isPrimary: json['isPrimary'] as bool?,
    );

Map<String, dynamic> _$BusinessAddressToJson(BusinessAddress instance) =>
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
