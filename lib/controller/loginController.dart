import 'dart:convert';
import 'package:fyp_inventory/controller/baseController.dart';
import 'package:fyp_inventory/controller/url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  static var prefs = BaseController.getPrefs();
  static var baseUrl = "${prefs.getString("baseUrl")}login/token";

  static Future<dynamic> login(String username, String password) async {
    var url = Uri.parse(baseUrl);

    var body = {'username': username, 'password': password};

    var req = http.MultipartRequest("POST", url);
    req.headers.addAll({'Accept': '*/*', 'Content-Type': 'application/json'});
    req.fields.addAll(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      prefs.setString(
          "token",
          (jsonDecode(resBody)["token_type"] +
              " " +
              jsonDecode(resBody)["access_token"]));
      return 200;
    } else if (res.statusCode == 404) {
      return 404;
    } else {
      return 400;
    }
  }
}

void main(List<String> args) async {
  final prefs = await SharedPreferences.getInstance();
  BaseController.setPrefs(prefs);

  prefs.setString("baseUrl", await BaseUrl.get() + "/api/v1");

  var re = await LoginController.login("admin@nfc.iet", "Admin_1");
  print(re);
}
