import 'package:json_annotation/json_annotation.dart';

part 'actions.g.dart';

@JsonSerializable()
class Actions {
  bool? canView;
  bool? canAdvance;
  bool? canCancel;
  bool? canReject;
  bool? canReturn;

  Actions({
    this.canView,
    this.canAdvance,
    this.canCancel,
    this.canReject,
    this.canReturn,
  });

  factory Actions.fromJson(Map<String, dynamic> json) {
    return _$ActionsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ActionsToJson(this);
}
