import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String capitalizeWords() {
    return split(' ').map((word) => word.capitalize()).join(' ');
  }
}

String formatNaira(num amount) {
  final formatter = NumberFormat.currency(
    locale: 'en_NG',
    symbol: '₦',
    decimalDigits: 2,
  );
  return formatter.format(amount);
}

String formatNairaDouble(double amount) {
  final formatter = NumberFormat.currency(
    locale: 'en_NG',
    symbol: '₦',
    decimalDigits: 2,
  );
  return formatter.format(amount);
}

String formatNairaNoDecimal(num amount) {
  final formatter = NumberFormat.currency(
    locale: 'en_NG',
    symbol: '₦',
    decimalDigits: 0,
  );
  return formatter.format(amount);
}

String convertTo12HourFormat(String time) {
  final parts = time.split(':');
  int hour = int.parse(parts[0]);
  final minute = parts[1];

  final period = hour >= 12 ? 'PM' : 'AM';

  hour = hour % 12;
  if (hour == 0) hour = 12;

  return '${hour.toString().padLeft(2, '0')}:$minute $period';
}

String convertTo24Hour(String time) {
  final parsedTime = DateFormat('hh:mm a').parse(time);
  return DateFormat('HH:mm').format(parsedTime);
}

String convertDateToIso(String date) {
  final parsedDate = DateFormat('dd MMM, yyyy').parse(date);

  final dateTime = DateTime(
    parsedDate.year,
    parsedDate.month,
    parsedDate.day,
    7, // add your time
    0,
    0,
  );

  return dateTime.toUtc().toIso8601String();
}

String convertDate(String date) {
  final parsedDate = DateFormat('dd MMM, yyyy').parse(date);
  return DateFormat('yyyy-MM-dd').format(parsedDate);
}

String formatDate(String date) {
  final parsedDate = DateTime.parse(date);

  return DateFormat('MMM dd, yyyy, hh:mm a').format(parsedDate);
}

String formatDateNoTime(String date) {
  final parsedDate = DateTime.parse(date);

  return DateFormat('MMM dd, yyyy').format(parsedDate);
}
