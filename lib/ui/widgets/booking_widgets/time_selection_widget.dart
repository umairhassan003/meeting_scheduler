/*
 * File: time_selection_widget.dart
 * Copyrights - All rights reserved
 */

import 'package:meeting_scheduler/util/include.dart';

/// Time Selection Column Widget on Booking Page
class TimeSelectionWidget extends StatelessWidget {
  const TimeSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (context, provider, child) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // title time
                    Text(
                      Resources.timeTitle,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 12.h),
                    // Time widget
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12.w,
                        crossAxisSpacing: 12.w,
                        childAspectRatio: 3.5,
                        children: provider.timeSlots.map((t) {
                          final selected = t == provider.selectedTime;
                          return GestureDetector(
                            onTap: () {
                              provider.setTime(t);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                color: selected ? Colors.black : Colors.white,
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(33.w),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      t,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: selected
                                              ? Colors.white
                                              : Colors.black87,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Icon(
                                    selected
                                        ? Icons.radio_button_checked
                                        : Icons.radio_button_off_outlined,
                                    color:
                                        selected ? Colors.green : Colors.grey,
                                    size: 25.r,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
