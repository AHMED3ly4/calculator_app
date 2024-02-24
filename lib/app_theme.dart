import 'package:flutter/material.dart';

class AppTheme{
  static Color grey=const Color(0xFF8d9ba9);
  static Color white=Colors.white;
  static ThemeData appTheme=ThemeData(
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: Color(0xFFebedef),
        fontSize: 30,
        fontWeight: FontWeight.w600
      ),
      bodyMedium: TextStyle(
        color: grey,
        fontSize: 45,
        fontWeight: FontWeight.w400
      ),
      bodyLarge: TextStyle(
        color: white,
        fontSize: 60,
      ),
    )
  );
}