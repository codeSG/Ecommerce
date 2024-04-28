import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  //Instance of shared preferences
  static late final SharedPreferences instance;
//Intitalise the value at launching of app
  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();
// For setting boolean value
  static void setBool({required String key, required bool value}) async {
    //SharedPreferences sharedPreferences = await _getPreference();
    await instance.setBool(key, value);
  }

//For getting boolean value
  static bool? getBool({required String key}) {
    //SharedPreferences sharedPreferences = await _getPreference();
    return instance.getBool(key);
  }
//For setting integer value
  static Future<void> setTheme(
      {required String key, required ThemeMode themeMode}) async {
    await instance.setInt(key, themeMode.index);
  }

//For setting dark and light theme
  static ThemeMode getTheme({required String key}) {
    final index = instance.getInt(key);
    switch (index) {
      case 0:
        return ThemeMode.system;
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
