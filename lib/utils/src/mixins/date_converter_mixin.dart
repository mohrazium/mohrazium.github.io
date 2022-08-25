
import 'package:persian_tools/persian_tools.dart';
import 'package:shamsi_date/shamsi_date.dart';

mixin DateConverterMixin {
  String shamsiNow() => DateConverter.toShamsi(DateTime.now());

  String toShamsi(DateTime? dateTime) => DateConverter.toShamsi(dateTime);

  DateTime toDateTime({
    int? year,
    int? month,
    int? day,
    int hour = 0,
    int minute = 0,
    int second = 0,
    String? shamsiDate,
    int? yearsBefore,
  }) {
    if (shamsiDate == null) {
      return DateConverter.toDateTime(year: year!, month: month!, day: day!);
    } else {
      return DateConverter.toDateTime(shamsiDate: shamsiDate);
    }
  }

  int differenceInDays(String startShamsiDate, String endShamsiDate) {
    try {
      final start = DateConverter.toDateTime(shamsiDate: startShamsiDate);
      final end = DateConverter.toDateTime(shamsiDate: endShamsiDate);
      return DateConverter.differenceInDays(start, end);
    } catch (e) {
      return 0;
    }
  }

  int differenceInHours(String startTime, String endTime) {
    final start = DateConverter.toDateTime(shamsiDate: startTime);
    final end = DateConverter.toDateTime(shamsiDate: endTime);
    return DateConverter.differenceInHours(start, end);
  }

  String calculateEndDate({
    required String startDate,
    required int months,
    required int pastDays,
  }) {
    final start = DateConverter.toDateTime(shamsiDate: startDate);
    final calculated = DateConverter.calculateEndDate(start, months, pastDays);
    return DateConverter.toShamsi(calculated);
  }
}

class DateConverter {
  static String toShamsi(DateTime? dateTime) {
    if (dateTime != null) {
      Jalali jalali = dateTime.toJalali();
      String month;
      String day;

      if (jalali.month < 10) {
        month = "0${jalali.month}";
      } else {
        month = jalali.month.toString();
      }

      if (jalali.day < 10) {
        day = "0${jalali.day}";
      } else {
        day = jalali.day.toString();
      }

      return convertEnToFa("${jalali.year}/$month/$day");
    }
    return "";
  }

  static DateTime toDateTime({
    int? year,
    int? month,
    int? day,
    int hour = 0,
    int minute = 0,
    int second = 0,
    String? shamsiDate,
    int? yearsBefore,
  }) {
    if (shamsiDate == null) {
      return Jalali(year!, month!, day!, hour, minute, second).toDateTime();
    } else {
      shamsiDate = convertFaToEn(shamsiDate);

      final splitDate = (shamsiDate.split("/"));
      final y = int.parse(splitDate[0]);
      final m = int.parse(splitDate[1]);
      final d = int.parse(splitDate[2]);

      if (yearsBefore != null) {
        return toDateTime(
          year: y <= (DateTime.now().toJalali().year - 50) ? y : DateTime.now().toJalali().year - 50,
          month: m <= 12 ? m : 12,
          day: d <= 31 ? d : 30,
        );
      } else {
        return toDateTime(year: y, month: m, day: d);
      }
    }
  }

  static int differenceInDays(DateTime start, DateTime end) {
    final days = end.difference(start).inDays + const Duration(days: 1).inDays;
    return days.isNegative ? 0 : days;
  }

  static int differenceInHours(DateTime start, DateTime end) {
    return end.difference(start).inHours;
  }

  static DateTime? calculateEndDate(DateTime startDate, int months, int pastDay) {
    final gregorian = Gregorian.fromDateTime(startDate);
    final endDate = gregorian.addMonths(months);
    final res = endDate.addDays(-(pastDay + 1));
    return res.toDateTime();
  }
}
