// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Staff _$StaffFromJson(Map<String, dynamic> json) => Staff(
  membershipId: json['membershipId'] as String?,
  status: json['status'] as String?,
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
  profile: json['profile'] == null
      ? null
      : Profile.fromJson(json['profile'] as Map<String, dynamic>),
  role: json['role'] == null
      ? null
      : Role.fromJson(json['role'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StaffToJson(Staff instance) => <String, dynamic>{
  'membershipId': instance.membershipId,
  'status': instance.status,
  'user': instance.user,
  'profile': instance.profile,
  'role': instance.role,
};
