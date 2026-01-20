import 'package:intl/intl.dart';

class DailyDoseTime {
  String? time;
  String? date;
  DateTime? isoDate;

  DailyDoseTime({this.time, this.date, this.isoDate});

  /// Utility: safely convert any time string to 24-hour format
  static String? _normalizeTo24Hour(String? rawTime) {
    if (rawTime == null || rawTime.trim().isEmpty) return null;

    // 🧹 Clean invisible / non-breaking spaces
    rawTime = rawTime
        .trim()
        .replaceAll(RegExp(r'[^\x00-\x7F]+'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ');

    try {
      // Try parsing as 12-hour format (e.g. "9:30 PM")
      final parsed = DateFormat.jm().parse(rawTime);
      return DateFormat('HH:mm').format(parsed);
    } catch (_) {
      try {
        // Try parsing as 24-hour format (e.g. "21:30")
        final parsed = DateFormat('HH:mm').parse(rawTime);
        return DateFormat('HH:mm').format(parsed);
      } catch (e) {
        print('Time parse error: $e for "$rawTime"');
        return rawTime; // fallback to original
      }
    }
  }

  factory DailyDoseTime.fromJson(Map<String, dynamic> json) {
    return DailyDoseTime(
      time: _normalizeTo24Hour(json['time']),
      date: json['date'] as String?,
      isoDate: json['isoDate'] == null
          ? null
          : DateTime.tryParse(json['isoDate'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'time': _normalizeTo24Hour(time),
    'date': date,
    'isoDate': isoDate?.toIso8601String(),
  };
}
