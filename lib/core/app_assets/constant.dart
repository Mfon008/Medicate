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
