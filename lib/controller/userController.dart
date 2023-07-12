import 'dart:convert';

import 'package:fyp_inventory/controller/baseController.dart';
import 'package:http/http.dart' as http;

import 'package:fyp_inventory/models/user.dart';

class UserController {
  static var prefs = BaseController.getPrefs();
  static var baseUrl = "${prefs.getString("baseUrl")}/api/v1/users/";
  static var headers = {
    'Accept': '*/*',
    'Authorization': prefs.getString("token").toString(),
    'Content-Type': 'application/json'
  };

  static Future<User> read() async {
    var url = Uri.parse(baseUrl);

    var req = http.Request("GET", url);
    req.headers.addAll(headers);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode == 200) {
      return userFromJson(resBody);
    } else {
      throw Exception(jsonDecode(resBody)["detail"]);
    }
  }
}
