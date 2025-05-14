import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meeting_scheduler/util/include.dart';

ThemeData appThemeData = ThemeData(
  primaryColor: const Color(0xffffffff),
  primaryColorLight: Colors.purple.shade800,
  primaryColorDark: Colors.purple.shade900,
  secondaryHeaderColor: Colors.black,
  iconTheme: const IconThemeData(color: Colors.black),
  textTheme: GoogleFonts.ptSansTextTheme(),
  primaryTextTheme: GoogleFonts.ptSansTextTheme(),
  scaffoldBackgroundColor: const Color(0xfff3f3f3),
  fontFamily: AppStyle.metropolis,
  appBarTheme: const AppBarTheme(
    foregroundColor: Color.fromARGB(0, 17, 17, 17),
    iconTheme: IconThemeData(
      color: Color.fromARGB(0, 41, 136, 200),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: Colors.white,
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Colors.white,
  ),
  unselectedWidgetColor: Colors.black38,
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  }),
  scrollbarTheme: const ScrollbarThemeData()
      .copyWith(thickness: WidgetStateProperty.all(2)),
);
