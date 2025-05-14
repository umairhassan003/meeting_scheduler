/*
 * File: meeting_scheduler.dart
 * Copyrights - All rights reserved
 */

import 'package:meeting_scheduler/util/include.dart';

class LabApp extends StatefulWidget {
  const LabApp({Key? key}) : super(key: key);

  @override
  State<LabApp> createState() => _LabAppState();
}

class _LabAppState extends State<LabApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meeting App',
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) => "Meeting App",
      theme: appThemeData,
      home: const BookingPage(),
    );
  }
}
