// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Membership _$MembershipFromJson(Map<String, dynamic> json) => Membership(
  tenantId: json['tenantId'] as String?,
  tenantName: json['tenantName'] as String?,
  tenantType: json['tenantType'] as String?,
  role: json['role'] as String?,
  permissions: (json['permissions'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  kycStatus: json['kycStatus'] as String?,
  profileCompletionPercentage: (json['profileCompletionPercentage'] as num?)
      ?.toInt(),
);

Map<String, dynamic> _$MembershipToJson(Membership instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'tenantName': instance.tenantName,
      'tenantType': instance.tenantType,
      'role': instance.role,
      'permissions': instance.permissions,
      'kycStatus': instance.kycStatus,
      'profileCompletionPercentage': instance.profileCompletionPercentage,
    };
