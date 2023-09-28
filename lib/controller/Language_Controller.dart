import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends ChangeNotifier {
  bool _isEnglish = false;
  late SharedPreferences preferences;

  LanguageController({required this.preferences});

  get getLanguage {
    _isEnglish = preferences.getBool('language') ?? false;
    return _isEnglish;
  }

  changeLanguage() {
    _isEnglish = !_isEnglish;
    preferences.setBool('language', _isEnglish);
    print("Language English = ${_isEnglish}");
    notifyListeners();
  }
}
