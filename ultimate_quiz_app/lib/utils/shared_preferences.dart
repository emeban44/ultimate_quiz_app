import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

// The shared preferences help the simple tasks

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;
  init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  void setAuthenticated(bool value) {
    _sharedPrefs?.setBool('authenticated', value);
  }

  void setSymbols(Map<String, String> symbols) {
    var s = jsonEncode(symbols);
    _sharedPrefs?.setString('symbols', s);
  }

// the symbols are stored locally inside this bool

  bool? get getAuthenticated {
    if (_sharedPrefs?.getBool('authenticated') == null) {
      _sharedPrefs?.setBool('authenticated', false);
    }
    return _sharedPrefs?.getBool('authenticated');
  }

// the boolean value for already using the app for the first time is stored here

  // bool get getAppUsedBefore {
  //   if (_sharedPrefs.getBool('used') == null) return false;
  //   return _sharedPrefs.getBool('used');
  // }
}
