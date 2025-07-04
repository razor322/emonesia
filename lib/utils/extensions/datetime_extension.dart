import 'package:intl/intl.dart';

extension DatetimeExtension on DateTime {
  String getFormattedDate() => DateFormat('yyyy-MM-dd').format(this).toString();
  String getFormattedDateddMMyyyy() =>
      DateFormat('dd-MM-yyyy').format(this).toString();
}
