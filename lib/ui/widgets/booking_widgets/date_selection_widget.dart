/*
 * File: date_selection_widget.dart
 * Copyrights - All rights reserved
 */

import 'package:intl/intl.dart';
import 'package:meeting_scheduler/util/include.dart';

/// Date Selection Column Widget on Booking Page
class DateSelectionWidget extends StatelessWidget {
  const DateSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime firstDay = DateTime(now.year, now.month);
    final DateTime lastDay =
        DateTime(now.year, now.month, now.day + 90); // end of 3rd month
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                Resources.dateTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: TableCalendar(
                  firstDay: firstDay,
                  lastDay: lastDay,
                  focusedDay: provider.focusedDay.isBefore(firstDay)
                      ? firstDay
                      : provider.focusedDay.isAfter(lastDay)
                          ? lastDay
                          : provider.focusedDay,
                  // focusedDay: provider.focusedDay,
                  selectedDayPredicate: (day) =>
                      isSameDay(provider.selectedDay, day),
                  onDaySelected: (selected, focused) {
                    provider.setDate(selected, focused);
                  },
                  onPageChanged: (focusedDay) {
                    provider.setFocusedDay(focusedDay);
                  },
                  calendarStyle: CalendarStyle(
                    selectedDecoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    weekendTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    defaultTextStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  headerStyle: const HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    leftChevronVisible: false,
                    rightChevronVisible: false,
                  ),
                  enabledDayPredicate: (day) {
                    final now = DateTime.now();
                    final maxDate = now.add(const Duration(days: 90));
                    return day.isAfter(now.subtract(const Duration(days: 1))) &&
                        day.isBefore(maxDate.add(const Duration(days: 1)));
                  },
                  calendarBuilders: CalendarBuilders(
                    headerTitleBuilder: (context, day) {
                      final now = DateTime.now();
                      final maxDay = now.add(const Duration(days: 90));
                      final title = DateFormat.MMMM().format(day);

                      return Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Left Arrow
                              GestureDetector(
                                onTap: () {
                                  final prevMonth = provider.getAdjustedMonth(
                                      provider.focusedDay, -1);
                                  if (!prevMonth.isBefore(
                                      DateTime(now.year, now.month))) {
                                    provider.setFocusedDay(prevMonth);
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(2.r),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.chevron_left,
                                      size: 20.r, color: Colors.black),
                                ),
                              ),
                              SizedBox(width: 20.w),

                              // Title
                              Text(
                                title.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 20.w),

                              // Right Arrow
                              GestureDetector(
                                onTap: () {
                                  final nextMonth = provider.getAdjustedMonth(
                                      provider.focusedDay, 1);
                                  if (!nextMonth.isAfter(
                                      DateTime(maxDay.year, maxDay.month))) {
                                    provider.setFocusedDay(nextMonth);
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(2.r),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.chevron_right,
                                      size: 20.r, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
