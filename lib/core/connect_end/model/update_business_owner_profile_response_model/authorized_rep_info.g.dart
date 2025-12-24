// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorized_rep_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizedRepInfo _$AuthorizedRepInfoFromJson(Map<String, dynamic> json) =>
    AuthorizedRepInfo(
      fullName: json['fullName'] as String?,
      position: json['position'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      meansOfId: json['meansOfId'] == null
          ? null
          : MeansOfId.fromJson(json['meansOfId'] as Map<String, dynamic>),
      meansOfIdType: json['meansOfIdType'] as String?,
    );

Map<String, dynamic> _$AuthorizedRepInfoToJson(AuthorizedRepInfo instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'position': instance.position,
      'phone': instance.phone,
      'email': instance.email,
      'meansOfId': instance.meansOfId,
      'meansOfIdType': instance.meansOfIdType,
    };
