// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_draft_reminder_entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveDraftReminderEntityModel _$SaveDraftReminderEntityModelFromJson(
  Map<String, dynamic> json,
) => SaveDraftReminderEntityModel(
  title: json['title'] as String?,
  payload: json['payload'] == null
      ? null
      : Payload.fromJson(json['payload'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SaveDraftReminderEntityModelToJson(
  SaveDraftReminderEntityModel instance,
) => <String, dynamic>{'title': instance.title, 'payload': instance.payload};
