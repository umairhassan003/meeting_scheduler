/*
 * File: top_bar_widget.dart
 * Copyrights - All rights reserved
 */

import 'package:meeting_scheduler/util/include.dart';

/// Common top bar Widget on Booking Page
class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Circular overlapped user icons
        SizedBox(
          width: 80.w,
          height: 60.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: const AssetImage(Assets.men),
              ),
              Positioned(
                left: 20.w,
                child: CircleAvatar(
                  radius: 30.r,
                  backgroundImage: const AssetImage(Assets.women),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10.w),
        // Meeting Text
        Text(
          Resources.angeloKateMeeting,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: Colors.black,
              fontStyle: FontStyle.italic),
        ),
        const Spacer(),
        // Add More participants Text
        Text(
          Resources.addMoreParticipants,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontStyle: FontStyle.italic),
        ),
        const SizedBox(width: 10),
        // Round dotted border add button
        DottedBorder(
          borderType: BorderType.Circle,
          color: Colors.grey,
          dashPattern: const [4, 3],
          strokeWidth: 1.5,
          child: Container(
            padding: EdgeInsets.all(10.w),
            child: Icon(
              Icons.add,
              size: 20.r,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
