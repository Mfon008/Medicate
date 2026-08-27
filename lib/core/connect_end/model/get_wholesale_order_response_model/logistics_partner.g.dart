// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logistics_partner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogisticsPartner _$LogisticsPartnerFromJson(Map<String, dynamic> json) =>
    LogisticsPartner(
      id: json['id'] as String?,
      name: json['name'] as String?,
      contactPerson: json['contactPerson'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      coverageNotes: json['coverageNotes'] as String?,
    );

Map<String, dynamic> _$LogisticsPartnerToJson(LogisticsPartner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'contactPerson': instance.contactPerson,
      'phone': instance.phone,
      'email': instance.email,
      'coverageNotes': instance.coverageNotes,
    };
