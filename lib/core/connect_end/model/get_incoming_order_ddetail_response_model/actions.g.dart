// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Actions _$ActionsFromJson(Map<String, dynamic> json) => Actions(
  canView: json['canView'] as bool?,
  canAdvance: json['canAdvance'] as bool?,
  canCancel: json['canCancel'] as bool?,
  canReject: json['canReject'] as bool?,
  canReturn: json['canReturn'] as bool?,
);

Map<String, dynamic> _$ActionsToJson(Actions instance) => <String, dynamic>{
  'canView': instance.canView,
  'canAdvance': instance.canAdvance,
  'canCancel': instance.canCancel,
  'canReject': instance.canReject,
  'canReturn': instance.canReturn,
};
