/*
 * File: enum.dart
 * Copyrights - All rights reserved
 */

/// All Enums to be used in app
extension DateHelpers on DateTime {
  String get monthName {
    const m = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return m[month];
  }

  String get weekdayName {
    const d = [
      '',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return d[weekday];
  }
}
