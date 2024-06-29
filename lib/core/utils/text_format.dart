import 'package:intl/intl.dart';

String formatDate(String? dateStr) {
  DateTime date = DateTime.parse(dateStr.toString());
  return DateFormat('EEEE, d MMMM yyyy').format(date);
}