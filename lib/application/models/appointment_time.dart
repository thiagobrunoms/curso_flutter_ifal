import 'package:curso_ifal_flutter/utils/date_formatters.dart';

class AppointmentTime {
  final DateTime initTime;
  final DateTime endTime;

  AppointmentTime(this.initTime, this.endTime);

  String get initTimeEndTime =>
      '${DateFormatters.fromDateTimeToTime(initTime)} - ${DateFormatters.fromDateTimeToTime(endTime)}';
}
