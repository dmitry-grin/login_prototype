import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHandler extends ChangeNotifier {
  bool isLogined;

  final String key = 'isLogined';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  AuthHandler._privateConstructor();

  static AuthHandler _instance = AuthHandler._privateConstructor();

  factory AuthHandler() {
    return _instance;
  }

  Future<void> loadPrefs() async {
    final prefs = await _prefs;
    isLogined = prefs.getBool(key) ?? false;
  }

  Future<void> changeLoginStatus() async {
    final prefs = await _prefs;
    isLogined = !isLogined;
    prefs.setBool(key, isLogined);
    notifyListeners();
  }
}
