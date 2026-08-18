// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nafdac_verification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NafdacVerification _$NafdacVerificationFromJson(Map<String, dynamic> json) =>
    NafdacVerification(
      registrationNumber: json['registrationNumber'] as String?,
      isVerified: json['isVerified'] as bool?,
      productName: json['productName'] as String?,
      manufacturer: json['manufacturer'] as String?,
      status: json['status'] as String?,
      verifiedAt: json['verifiedAt'] == null
          ? null
          : DateTime.parse(json['verifiedAt'] as String),
    );

Map<String, dynamic> _$NafdacVerificationToJson(NafdacVerification instance) =>
    <String, dynamic>{
      'registrationNumber': instance.registrationNumber,
      'isVerified': instance.isVerified,
      'productName': instance.productName,
      'manufacturer': instance.manufacturer,
      'status': instance.status,
      'verifiedAt': instance.verifiedAt?.toIso8601String(),
    };
