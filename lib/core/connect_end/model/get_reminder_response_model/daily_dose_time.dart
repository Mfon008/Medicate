import 'package:json_annotation/json_annotation.dart';

part 'daily_dose_time.g.dart';

@JsonSerializable()
class DailyDoseTime {
  String? time;
  String? date;
  DateTime? isoDate;
  String? status;
  @JsonKey(name: '_id')
  String? id;

  DailyDoseTime({this.time, this.date, this.isoDate, this.status, this.id});

  factory DailyDoseTime.fromJson(Map<String, dynamic> json) {
    return _$DailyDoseTimeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DailyDoseTimeToJson(this);
}
