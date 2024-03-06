import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _preferences;
  static bool _firstTime = true;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Modo oscuro
  static bool get firstTime {
    return _preferences.getBool('firstTime') ?? true;
  }

  static set firstTime(bool value) {
    _firstTime = value;
    _preferences.setBool('firstTime', _firstTime);
  }

 
}
