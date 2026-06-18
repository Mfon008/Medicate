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


// String convertTo12HourFormat(String time) {
//   final parsedTime = DateFormat('HH:mm').parse(time);
//   return DateFormat('hh:mm a').format(parsedTime);
// }
