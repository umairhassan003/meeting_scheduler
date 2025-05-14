/*
 * File: home_provider.dart
 * Copyrights - All rights reserved
 */

import 'package:meeting_scheduler/util/include.dart';

/// Home Page Provider contains binding for meeting dashboard
class HomeProvider extends BaseProvider {
  // initializing data
  HomeProvider() {
    // adding timeslots to UI
    timeSlots = generateTimeSlots(
      startTime: const TimeOfDay(hour: 21, minute: 30), // 9:30 PM
      endTime: const TimeOfDay(hour: 23, minute: 45), // 11:45 PM
    );

    // adding durations data to UI
    durations = generateDurationData();

    // current time zone of user
    selectedTimeZone = Utilities.getCurrentTimeZoneLabel();
  }

  // 1. Duration
  List<DurationModel> durations = [];
  int? selectedDuration;

  // 2. Date (TableCalendar)
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  // 3. Time
  List<String> timeSlots = [];
  String? selectedTime;

  // Time Zone selection
  String selectedTimeZone = "";

// generate list of time slots
  List<String> generateTimeSlots({
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    int intervalMinutes = 15,
  }) {
    List<String> timeSlots = [];
    int startMinutes = startTime.hour * 60 + startTime.minute;
    int endMinutes = endTime.hour * 60 + endTime.minute;

    for (int time = startMinutes; time <= endMinutes; time += intervalMinutes) {
      int hour = time ~/ 60;
      int minute = time % 60;

      final period = hour >= 12 ? 'PM' : 'AM';
      final displayHour = hour % 12 == 0 ? 12 : hour % 12;
      final formattedMinute = minute.toString().padLeft(2, '0');

      timeSlots.add('$displayHour:$formattedMinute $period');
    }

    return timeSlots;
  }

  // generate durations
  List<DurationModel> generateDurationData() {
    return [
      for (final duration in ['15 MIN', '30 MIN', '60 MIN'])
        DurationModel(
          label: duration,
          description:
              "Let's Connect! Schedule a $duration slot for a brief discussion on any topic you'd like – whether it’s about a project, brainstorming ideas, or just catching up. Looking forward to connecting with you!",
        ),
    ];
  }

  // set duration of meeting
  setDuration(int i) {
    selectedDuration = i;
    notifyListeners();
  }

  // set date of meeting
  setDate(DateTime selected, DateTime focused) {
    selectedDay = selected;
    focusedDay = focused;
    notifyListeners();
  }

  // set time of the meeting
  setTime(String time) {
    selectedTime = time;
    notifyListeners();
  }

  // set focused day
  void setFocusedDay(DateTime day) {
    focusedDay = day;
    notifyListeners();
  }

// cancel booking request form and reset selected time slot
  cancelBooking() {
    selectedTime = null;
    notifyListeners();
  }

// confirm Booking
  confirmBooking() {
    resetData();
    notifyListeners();
  }

// reset booking form
  resetData() {
    selectedDuration = null;
    selectedDay = null;
    selectedTime = null;
    focusedDay = DateTime.now();
  }

// Method to get adjust month based on date
  DateTime getAdjustedMonth(DateTime date, int offset) {
    int year = date.year;
    int month = date.month + offset;

    while (month < 1) {
      month += 12;
      year -= 1;
    }
    while (month > 12) {
      month -= 12;
      year += 1;
    }

    return DateTime(year, month);
  }

// update selected time zone
  void setSelectedTimeZone(String tz) {
    selectedTimeZone = tz;
    notifyListeners();
  }
}
