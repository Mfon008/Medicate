// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactPerson _$ContactPersonFromJson(Map<String, dynamic> json) =>
    ContactPerson(
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      idType: json['idType'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$ContactPersonToJson(ContactPerson instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'idType': instance.idType,
      'address': instance.address,
    };
