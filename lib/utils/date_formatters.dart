import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DateFormatters {
  static String toDayNameMonthDate(DateTime dateTime) {
    return DateFormat("E, MMM d, yy").format(dateTime);
  }

  static String fromDateTimeToTime(DateTime t) {
    return DateFormat.jm().format(t);
  }
}
