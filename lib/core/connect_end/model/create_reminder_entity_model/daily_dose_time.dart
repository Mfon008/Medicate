class DailyDoseTime {
  String? time;
  String? date;
  DateTime? isoDate;

  DailyDoseTime({this.time, this.date, this.isoDate});

  factory DailyDoseTime.fromJson(Map<String, dynamic> json) => DailyDoseTime(
    time: json['time'] as String?,
    date: json['date'] as String?,
    isoDate: json['isoDate'] == null
        ? null
        : DateTime.parse(json['isoDate'] as String),
  );

  Map<String, dynamic> toJson() => {
    'time': time,
    'date': date,
    'isoDate': isoDate?.toIso8601String(),
  };
}
