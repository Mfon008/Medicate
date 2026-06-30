import 'package:json_annotation/json_annotation.dart';

import 'payload.dart';

part 'save_draft_reminder_entity_model.g.dart';

@JsonSerializable()
class SaveDraftReminderEntityModel {
  String? title;
  Payload? payload;

  SaveDraftReminderEntityModel({this.title, this.payload});

  factory SaveDraftReminderEntityModel.fromJson(Map<String, dynamic> json) {
    return _$SaveDraftReminderEntityModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SaveDraftReminderEntityModelToJson(this);
}
