import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightMode => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xffF5F3F5),
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0.0,
          backgroundColor: Color(0xffF5F3F5),
          foregroundColor: Color(0xff121212),
        ),
        colorScheme: const ColorScheme.light(
          surface: Color(0xffffffff),
          primary: Color(0xff274690),
          secondary: Color(0xff000000),
          tertiary: Color(0xff626262),
          error: Colors.redAccent,
        ),
      );

  static ThemeData get darkMode => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xff121212),
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0.0,
          backgroundColor: Color(0xff121212),
          foregroundColor: Color(0xffF5F3F5),
        ),
        colorScheme: const ColorScheme.dark(
          brightness: Brightness.dark,
          surface: Color(0xff121212),
          primary: Color(0xff274690),
          secondary: Color(0xff576CA8),
          error: Colors.redAccent,
        ),
      );
}
