/*
 * File: utilities.dart
 * Copyrights - All rights reserved
 */

import 'package:flutter/material.dart';

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
    // TODO: create common method for showing toast in the app
  }
}
