import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier{
  ThemeMode appMode = ThemeMode.light;
  void changeAppTheme(ThemeMode selectedTheme){
    if(selectedTheme == appMode){
      return;
    }
    appMode =selectedTheme;
    notifyListeners();
  }
}