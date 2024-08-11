import 'package:anber/Themes/dark_mode.dart';
import 'package:anber/Themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeProvider(bool isDark) {
    if (isDark) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (_themeData == lightMode) {
      themeData = darkMode;
      sharedPreferences.setBool("DarkMode", true);
    } else {
      themeData = lightMode;
      sharedPreferences.setBool("DarkMode", false);
    }
  }
}
