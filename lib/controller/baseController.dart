import 'package:shared_preferences/shared_preferences.dart';

class BaseController {
  static var _prefs;

  static void setPrefs(SharedPreferences prefs) {
    _prefs = prefs;
  }

  static SharedPreferences getPrefs() {
    return _prefs;
  }
}
