import 'dart:convert';
import 'package:fyp_inventory/controller/baseController.dart';
import 'package:fyp_inventory/controller/url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  static var prefs = BaseController.getPrefs();
  static var baseUrl = "${prefs.getString("baseUrl")}/api/v1/login/token";

  static Future<dynamic> login(String username, String password) async {
    var url = Uri.parse(baseUrl);
    var body = {'username': username.trim(), 'password': password.trim()};

    var req = http.MultipartRequest("POST", url);
    req.headers.addAll({'Accept': '*/*', 'Content-Type': 'application/json'});
    req.fields.addAll(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode == 200) {
      prefs.setString(
          "token",
          (jsonDecode(resBody)["token_type"] +
              " " +
              jsonDecode(resBody)["access_token"]));
      return {"statusCode": 200, "detail": "Sucessfull Login!"};
    } else if (res.statusCode == 404) {
      return {"statusCode": 404, "detail": jsonDecode(resBody)["detail"]};
    } else if (res.statusCode == 401) {
      return {"statusCode": 401, "detail": jsonDecode(resBody)["detail"]};
    } else {
      return {"statusCode": 400, "detail": jsonDecode(resBody)["detail"]};
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
