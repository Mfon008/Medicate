// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalNetwork _$HospitalNetworkFromJson(Map<String, dynamic> json) =>
    HospitalNetwork(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$HospitalNetworkToJson(HospitalNetwork instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'state': instance.state,
      'city': instance.city,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'isActive': instance.isActive,
    };
