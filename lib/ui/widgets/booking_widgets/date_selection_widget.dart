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
    return Consumer<HomeProvider>(
        builder: (context, provider, child) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Widget title
                    Text(
                      Resources.dateTitle,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 12),

                    // Calander Widget
                    Expanded(
                      child: TableCalendar(
                          firstDay: DateTime.now()
                              .subtract(const Duration(days: 365)),
                          lastDay:
                              DateTime.now().add(const Duration(days: 365)),
                          focusedDay: provider.focusedDay,
                          selectedDayPredicate: (day) =>
                              isSameDay(provider.selectedDay, day),
                          onDaySelected: (selected, focused) {
                            provider.setDate(selected, focused);
                          },
                          calendarStyle: CalendarStyle(
                            selectedDecoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            selectedTextStyle:
                                TextStyle(color: Colors.white, fontSize: 12.sp),
                            todayDecoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle,
                            ),
                            weekendTextStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                            defaultTextStyle: TextStyle(
                                color: Colors.black87,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          headerStyle: HeaderStyle(
                            titleCentered: true,
                            formatButtonVisible: false,
                            leftChevronVisible: false,
                            rightChevronVisible: false,
                            titleTextStyle: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w500),
                          ),
                          calendarBuilders: CalendarBuilders(
                            headerTitleBuilder: (context, day) {
                              final title = DateFormat.yMMMM()
                                  .format(day); // e.g. "May 2025"

                              return Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 6.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Left icon with gray background
                                      Container(
                                        padding: EdgeInsets.all(2.r), //
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          shape: BoxShape.circle,
                                        ),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Icon(Icons.chevron_left,
                                              size: 20.r, color: Colors.black),
                                        ),
                                      ),
                                      SizedBox(width: 6.w),
                                      // Title
                                      Text(
                                        title,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(width: 6.w),
                                      // Right icon with gray background
                                      Container(
                                        padding: EdgeInsets.all(2.r),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          shape: BoxShape.circle,
                                        ),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Icon(Icons.chevron_right,
                                              size: 20.r, color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ));
  }
}
