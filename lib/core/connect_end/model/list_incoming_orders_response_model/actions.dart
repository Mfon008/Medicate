import 'package:json_annotation/json_annotation.dart';

part 'actions.g.dart';

@JsonSerializable()
class Actions {
  bool? canView;
  bool? requiresOrderItemId;

  Actions({this.canView, this.requiresOrderItemId});

  factory Actions.fromJson(Map<String, dynamic> json) {
    return _$ActionsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ActionsToJson(this);
}
