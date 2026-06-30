import 'package:json_annotation/json_annotation.dart';

part 'daily_dose_time.g.dart';

@JsonSerializable()
class DailyDoseTime {
  String? time;
  String? date;
  DateTime? isoDate;

  DailyDoseTime({this.time, this.date, this.isoDate});

  factory DailyDoseTime.fromJson(Map<String, dynamic> json) {
    return _$DailyDoseTimeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DailyDoseTimeToJson(this);
}
