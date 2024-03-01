import 'package:calculator_app/app_theme.dart';
import 'package:calculator_app/home_screen.dart';
import 'package:calculator_app/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(ChangeNotifierProvider(
    create: (_) => SettingProvider(),
      child: CalculatorApp(),
  ));
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: AppTheme.appLightTheme,
      darkTheme: AppTheme.appDarkTheme,
      themeMode: Provider.of<SettingProvider>(context).appMode,
    );
  }
}
