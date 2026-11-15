import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData darkTheme = ThemeData(

    useMaterial3: true,

    brightness: Brightness.dark,

    fontFamily: 'Roboto',

    scaffoldBackgroundColor:
    const Color(0xFF050A14),

    colorScheme: const ColorScheme.dark(

      primary: Colors.cyanAccent,

      secondary: Colors.cyan,

      surface: Color(0xFF141B25),
    ),

    appBarTheme: const AppBarTheme(

      backgroundColor: Colors.transparent,

      elevation: 0,
    ),

    navigationBarTheme:
    NavigationBarThemeData(

      backgroundColor:
      const Color(0xFF111827),

      indicatorColor:
      Colors.cyan.withOpacity(0.2),

      labelTextStyle:

      WidgetStateProperty.all(

        const TextStyle(

          color: Colors.white,

          fontSize: 12,
        ),
      ),
    ),

    textTheme: const TextTheme(

      bodyLarge: TextStyle(
        color: Colors.white,
      ),

      bodyMedium: TextStyle(
        color: Colors.white70,
      ),

      titleLarge: TextStyle(

        color: Colors.white,

        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(

    useMaterial3: true,

    brightness: Brightness.light,

    fontFamily: 'Roboto',

    scaffoldBackgroundColor:
    const Color(0xFFF7F7F7),

    colorScheme: ColorScheme.light(

      primary: Colors.blue.shade400,

      secondary: Colors.cyan.shade400,

      surface: Colors.white,
    ),

    appBarTheme: const AppBarTheme(

      backgroundColor: Colors.transparent,

      elevation: 0,
    ),

    navigationBarTheme:
    NavigationBarThemeData(

      backgroundColor: Colors.white,

      indicatorColor:
      Colors.blue.withOpacity(0.15),

      labelTextStyle:

      WidgetStateProperty.all(

        const TextStyle(

          color: Colors.black87,

          fontSize: 12,
        ),
      ),
    ),

    textTheme: const TextTheme(

      bodyLarge: TextStyle(
        color: Colors.black,
      ),

      bodyMedium: TextStyle(
        color: Colors.black87,
      ),

      titleLarge: TextStyle(

        color: Colors.black,

        fontWeight: FontWeight.bold,
      ),
    ),
  );
}