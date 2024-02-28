import 'package:intl/intl.dart';

class MyDateFormatter {
  static String titleDate(DateTime input) {
    if (input.day == DateTime.now().day &&
        input.month == DateTime.now().month &&
        input.year == DateTime.now().year) {
      return 'Oggi';
    }
    if (input.day == DateTime.now().day + 1 &&
        input.month == DateTime.now().month &&
        input.year == DateTime.now().year) {
      return 'Domani';
    }

    DateFormat dateFormat = DateFormat('EEEE, dd MMM', 'it_IT');
    String formattedDate = dateFormat.format(input);
    formattedDate =
        formattedDate.replaceRange(0, 1, formattedDate[0].toUpperCase());
    return formattedDate;
  }

  static DateTime allDayStart(DateTime date) {
    DateTime start = DateTime(
      date.year,
      date.month,
      date.day,
      9,
      0,
    );
    return start;
  }

  static DateTime allDayEnd(DateTime date) {
    DateTime end = DateTime(
      date.year,
      date.month,
      date.day,
      18,
      0,
    );
    return end;
  }

  static DateTime morningStart(DateTime date) {
    DateTime start = DateTime(
      date.year,
      date.month,
      date.day,
      9,
      0,
    );
    return start;
  }

  static DateTime morningEnd(DateTime date) {
    DateTime end = DateTime(
      date.year,
      date.month,
      date.day,
      13,
      0,
    );
    return end;
  }

  static DateTime afternoonStart(DateTime date) {
    DateTime start = DateTime(
      date.year,
      date.month,
      date.day,
      14,
      0,
    );
    return start;
  }

  static DateTime afteroonEnd(DateTime date) {
    DateTime end = DateTime(
      date.year,
      date.month,
      date.day,
      18,
      0,
    );
    return end;
  }

  static DateTime? dateNow(DateTime inputDate) {
    DateTime now = DateTime.now();
    int min = now.minute;
    if (min < 30) {
      return now.subtract(Duration(minutes: min));
    }
    if (min > 30) {
      min -= 30;
      return now.subtract(Duration(minutes: min));
    }
    DateTime ris = DateTime(inputDate.year, inputDate.month, inputDate.day, now.hour,
        now.second, now.microsecond);
    return ris;
  }
}
