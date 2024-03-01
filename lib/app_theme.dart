import 'package:flutter/material.dart';

class AppTheme{
  static Color grey=const Color(0xFF8d9ba9);
  static Color white=const Color(0xFFebedef);
  static Color darkBlue=const Color(0xFF101d59);
  static Color black= Colors.black;
  static ThemeData appLightTheme=ThemeData(
    primaryColor: darkBlue,
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: darkBlue,
        fontSize: 30,
        fontWeight: FontWeight.w600
      ),
      bodyMedium: TextStyle(
        color: grey,
        fontSize: 45,
        fontWeight: FontWeight.w400
      ),
      bodyLarge: TextStyle(
        color: darkBlue,
        fontSize: 60,
      ),
    ),
    iconTheme: IconThemeData(
      color: white,
    ),
  );

  static ThemeData appDarkTheme=ThemeData(
    primaryColor: white,
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
    ),
    iconTheme: IconThemeData(
      color: white,
    ),
  );
}