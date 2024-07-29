

enum Month {
  January('Jan'),
  February('Feb'),
  March('Mar'),
  April('Apr'),
  May('May'),
  June('Jun'),
  July('Jul'),
  August('Aug'),
  September('Sep'),
  October('Oct'),
  November('Nov'),
  December('Dec');
  final String abbreviation;
  const Month(this.abbreviation);
}

extension MonthExtension on Month {
  static String getMonthName(int monthNumber) {
    if (monthNumber < 1 || monthNumber > 12) {
      throw ArgumentError('Month number must be between 1 and 12');
    }
    return Month.values[monthNumber - 1].abbreviation;
  }

  static int getMonthNumber(String monthName) {
    try {
      return Month.values.firstWhere((month) => month.abbreviation == monthName).index + 1;
    } catch (e) {
      throw ArgumentError('Invalid month name');
    }
  }
}
