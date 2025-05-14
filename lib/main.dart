/*
 * File: main.dart
 * Copyrights - All rights reserved
 */

import 'package:timezone/data/latest.dart' as tz;
import 'package:meeting_scheduler/util/include.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => HomeProvider()),
      ],
      child: const MeetingSchedulerApp(),
    ),
  );
}

class MeetingSchedulerApp extends StatelessWidget {
  const MeetingSchedulerApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1047),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            builder: (context, widget) {
              return MediaQuery(data: MediaQuery.of(context), child: widget!);
            },
            home: const BookingPage());
      },
    );
  }
}
