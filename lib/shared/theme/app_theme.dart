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
          surface: Color(0xffffffff), // Background
          primary: Color(0xff274690),
          secondary: Color(0xff000000),
          tertiary: Color(0xff626262),
          error: Colors.redAccent,
        ),
      );

  static ThemeData get darkMode => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xff1E1E1E), // Fondo oscuro
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0.0,
          backgroundColor: Color(0xff1E1E1E),
          foregroundColor: Color(0xffffffff),
        ),
        colorScheme: const ColorScheme.dark(
          surface: Color(0xff1E1E1E),
          primary: Color(0xff8AB4F8),
          secondary: Color(0xffF5F3F5),
          tertiary: Color(0xff626262),
          error: Colors.redAccent,
        ),
      );
}

//inversePrimary: Color(0xFF1B264F),