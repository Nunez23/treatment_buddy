import 'package:intl/intl.dart';

class DateUtils {
  static String formatDateTime(DateTime dateTime,
      {String format = 'yyyy-MM-dd HH:mm:ss'}) {
    final formatter = DateFormat(format);
    return formatter.format(dateTime);
  }

  static String formatDate(DateTime date, {String format = 'yyyy-MM-dd'}) {
    final formatter = DateFormat(format);
    return formatter.format(date);
  }

  static String formatTime(DateTime time, {String format = 'HH:mm:ss'}) {
    final formatter = DateFormat(format);
    return formatter.format(time);
  }

  static DateTime getToday() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static DateTime addDays(DateTime date, int days) {
    return date.add(Duration(days: days));
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  static bool isToday(DateTime date) {
    final today = getToday();
    return isSameDay(date, today);
  }

  static bool isPastDate(DateTime date) {
    final today = getToday();
    return date.isBefore(today);
  }
}