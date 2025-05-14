/*
 * File: confirm_booking_card_widget.dart
 * Copyrights - All rights reserved
 */

import 'package:meeting_scheduler/util/include.dart';

/// Confirm Booking Selection Popup on Booking Page
class ConfirmBookingCardWidget extends StatelessWidget {
  const ConfirmBookingCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (context, provider, child) => Positioned(
              bottom: 0,
              right: 0,
              left: MediaQuery.of(context).size.width * 0.7 + 32.w,
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                // Confirm Booking Title
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Resources.confirmBookingTitle,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 8.h),

                    // Booking Body text
                    RichText(
                      text: TextSpan(
                          text:
                              '${provider.durations[provider.selectedDuration!].label} ${Resources.meeting} ',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                              text: Resources.withText,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey.shade300,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text:
                                  '${Resources.angelBegetti}${provider.selectedDay!.weekdayName}, ${provider.selectedDay!.monthName} ${provider.selectedDay!.day}, at ${provider.selectedTime}',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            )
                          ]),
                    ),
                    SizedBox(height: 12.h),

                    // Confirm and cancel buttons
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // confirm action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: Text(
                            Resources.confirm,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(width: 12),
                        OutlinedButton(
                          onPressed: () {
                            // cancel action
                          },
                          child: Text(Resources.cancel,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
