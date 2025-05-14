/*
 * File: utilities.dart
 * Copyrights - All rights reserved
 */

import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;

/// Utilities object
/// Contains utility methods to be used in project
class Utilities {
  Utilities._();

// exception logging
  static Future<void> debugPrintCustom(dynamic exception,
      {StackTrace? stack, dynamic reason, bool sendToFirebase = false}) async {
    debugPrint("$exception");
    if (sendToFirebase) {
      // TODO: send exception to firebase after it's impelementation
    }
  }

// show toast in app
  static Future<void> showToast(String message) async {
    await showToast(message);
  }

// format time zone according to requirement
  static List<String> getFormattedTimezones() {
    final locations = tz.timeZoneDatabase.locations;
    return locations.entries.map((entry) {
      final location = tz.getLocation(entry.key);
      final now = tz.TZDateTime.now(location);
      final offset = now.timeZoneOffset;
      final offsetStr =
          '${offset.isNegative ? '-' : '+'}${offset.inHours.toString().padLeft(2, '0')}:${(offset.inMinutes.abs() % 60).toString().padLeft(2, '0')}';
      final abbrev = now.timeZoneName;
      final city = entry.key.split('/').last.replaceAll('_', ' ');
      return '($offsetStr) $abbrev – $city';
    }).toList();
  }

// User's current time zone
  static String getCurrentTimeZoneLabel() {
    final now = DateTime.now();
    final offset = now.timeZoneOffset;
    final offsetHours = offset.inHours.abs().toString().padLeft(2, '0');
    final offsetMinutes =
        (offset.inMinutes.abs() % 60).toString().padLeft(2, '0');
    final sign = offset.isNegative ? '-' : '+';
    final abbrev = now.timeZoneName;

    return '($sign$offsetHours:$offsetMinutes) $abbrev – LOCAL TIME';
  }
}
