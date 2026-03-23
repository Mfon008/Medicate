// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rejection_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RejectionInfo _$RejectionInfoFromJson(Map<String, dynamic> json) =>
    RejectionInfo(
      isRejected: json['isRejected'] as bool?,
      rejectionReason: json['rejectionReason'] as String?,
      rejectedAt: json['rejectedAt'] as String?,
    );

Map<String, dynamic> _$RejectionInfoToJson(RejectionInfo instance) =>
    <String, dynamic>{
      'isRejected': instance.isRejected,
      'rejectionReason': instance.rejectionReason,
      'rejectedAt': instance.rejectedAt,
    };
