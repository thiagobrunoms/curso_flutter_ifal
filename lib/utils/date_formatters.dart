import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DateFormatters {
  static String fromDateTimeToTime(DateTime t) {
    return DateFormat.jm().format(t);
  }
}
