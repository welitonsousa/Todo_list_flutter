import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static Future<String> getString(String key) async {
    var prefs = await SharedPreferences.getInstance();

    return prefs.getString(key) ?? "";
  }

  static void setString(String key, String s) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setString(key, s);
  }
}