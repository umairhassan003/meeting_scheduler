/*
 * File: booking_page.dart
 * Copyrights - All rights reserved
 */

import 'package:meeting_scheduler/util/include.dart';

/// Booking Stateless widget
/// Containg daskboard UI elements
class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (context, provider, child) => Scaffold(
              backgroundColor: Colors.grey[100],
              body: SafeArea(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: const Color(0xffF5F6F8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Top bar
                      const TopBarWidget(),
                      const SizedBox(height: 24),
                      Divider(
                        thickness: 1,
                        height: 1,
                        color: Colors.grey.shade300,
                      ),

                      Expanded(
                        child: Stack(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 1. Duration
                                const DurationSelectionWidget(),
                                SizedBox(width: 10.w),
                                VerticalDivider(
                                  thickness: 1,
                                  width: 1.w,
                                  color: Colors.grey.shade300,
                                ),
                                SizedBox(width: 10.w),
                                // 2. Date
                                const DateSelectionWidget(),
                                SizedBox(width: 10.w),
                                VerticalDivider(
                                  thickness: 1,
                                  width: 1,
                                  color: Colors.grey.shade300,
                                ),
                                SizedBox(width: 10.w),
                                // 3. Time
                                const TimeSelectionWidget(),
                              ],
                            ),

                            // 4. Confirm Booking card
                            if (provider.selectedDuration != null &&
                                provider.selectedDay != null &&
                                provider.selectedTime != null)
                              const ConfirmBookingCardWidget()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
