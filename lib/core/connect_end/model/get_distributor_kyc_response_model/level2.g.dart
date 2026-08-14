// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level2 _$Level2FromJson(Map<String, dynamic> json) => Level2(
  businessDetails: json['businessDetails'] == null
      ? null
      : BusinessDetails.fromJson(
          json['businessDetails'] as Map<String, dynamic>,
        ),
  companyDocuments: json['companyDocuments'] == null
      ? null
      : CompanyDocuments.fromJson(
          json['companyDocuments'] as Map<String, dynamic>,
        ),
  businessTypes: (json['businessTypes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  roleDocuments: json['roleDocuments'] == null
      ? null
      : RoleDocuments.fromJson(json['roleDocuments'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Level2ToJson(Level2 instance) => <String, dynamic>{
  'businessDetails': instance.businessDetails,
  'companyDocuments': instance.companyDocuments,
  'businessTypes': instance.businessTypes,
  'roleDocuments': instance.roleDocuments,
};
