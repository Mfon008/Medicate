import 'package:json_annotation/json_annotation.dart';

part 'actions.g.dart';

@JsonSerializable()
class Actions {
  bool? canView;
  bool? canAdvance;
  bool? canReject;
  bool? canReturn;
  bool? canCancel;
  bool? requiresOrderItemId;
  bool? requiresDeliveryId;

  Actions({
    this.canView,
    this.canAdvance,
    this.canReject,
    this.canReturn,
    this.canCancel,
    this.requiresOrderItemId,
    this.requiresDeliveryId,
  });

  factory Actions.fromJson(Map<String, dynamic> json) {
    return _$ActionsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ActionsToJson(this);
}
