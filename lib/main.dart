import 'package:calculator_app/app_theme.dart';
import 'package:calculator_app/home_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: AppTheme.appTheme,
    );
  }
}
