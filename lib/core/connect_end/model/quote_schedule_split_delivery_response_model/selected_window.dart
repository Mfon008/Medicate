import 'package:json_annotation/json_annotation.dart';

part 'selected_window.g.dart';

@JsonSerializable()
class SelectedWindow {
  String? deliveryDate;
  String? timeBlockStart;
  String? timeBlockEnd;
  String? timeWindowLabel;

  SelectedWindow({
    this.deliveryDate,
    this.timeBlockStart,
    this.timeBlockEnd,
    this.timeWindowLabel,
  });

  factory SelectedWindow.fromJson(Map<String, dynamic> json) {
    return _$SelectedWindowFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SelectedWindowToJson(this);
}
