/*
 * File: duration_selection_widget.dart
 * Copyrights - All rights reserved
 */

import 'package:meeting_scheduler/util/include.dart';

/// Duration Selection Column Widget on Booking Page
class DurationSelectionWidget extends StatelessWidget {
  const DurationSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (context, provider, child) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Page title
                    Text(
                      Resources.durationTitle,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 12.h),
                    // Duration List
                    Expanded(
                      child: ListView.builder(
                        itemCount: provider.durations.length,
                        itemBuilder: (ctx, i) {
                          final isSelected = i == provider.selectedDuration;
                          return GestureDetector(
                            onTap: () {
                              provider.setDuration(i);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 8.h),
                              padding: EdgeInsets.all(12.w),
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.black : Colors.white,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          provider.durations[i].label,
                                          style: TextStyle(
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        isSelected
                                            ? Icons.radio_button_checked
                                            : Icons.radio_button_off_outlined,
                                        size: 24.r,
                                        color: isSelected
                                            ? Colors.green
                                            : Colors.grey,
                                      ),
                                    ],
                                  ),
                                  if (isSelected &&
                                      provider.durations[i].description
                                          .isNotEmpty) ...[
                                    const SizedBox(height: 8),
                                    Text(
                                      provider.durations[i].description,
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 12.h),
                    // Bottom EST time zone
                    Center(
                        child: GestureDetector(
                      onTap: () async {
                        final timezones = Utilities.getFormattedTimezones();
                        final result = await showModalBottomSheet<String>(
                          context: context,
                          builder: (ctx) => ListView.builder(
                            itemCount: timezones.length,
                            itemBuilder: (ctx, i) {
                              return ListTile(
                                title: Text(timezones[i]),
                                onTap: () => Navigator.pop(ctx, timezones[i]),
                              );
                            },
                          ),
                        );

                        if (result != null) {
                          provider.setSelectedTimeZone(result);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Text(
                          provider.selectedTimeZone,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    )),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ));
  }
}
