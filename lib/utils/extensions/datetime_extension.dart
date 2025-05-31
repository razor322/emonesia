import 'package:intl/intl.dart';

extension DatetimeExtension on DateTime {
  String getFormattedDate() => DateFormat('yyyy-MM-dd').format(this).toString();
}
