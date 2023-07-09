import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class BaseController {
  static var _prefs;

  static void setPrefs(SharedPreferences prefs) {
    _prefs = prefs;
  }

  static SharedPreferences getPrefs() {
    return _prefs;
  }

  static Future<dynamic> checkAuthorization() async {
    var url = Uri.parse("${_prefs.getString("baseUrl")}/api/v1/token/");

    var req = http.Request("GET", url);
    req.headers.addAll({
      'Accept': '*/*',
      'Authorization': _prefs.getString("token").toString(),
      'Content-Type': 'application/json'
    });

    var res = await req.send();

    if (res.statusCode == 200) {
      return false;
    } else {
      return true;
    }
  }
}
