import 'dart:convert';

import 'package:fyp_inventory/controller/baseController.dart';
import 'package:http/http.dart' as http;

import 'package:fyp_inventory/models/user_role.dart';

class UserRoleController {
  static var prefs = BaseController.getPrefs();
  static var baseUrl = "${prefs.getString("baseUrl")}/api/v1/roles/";
  static var headers = {
    'Accept': '*/*',
    'Authorization': prefs.getString("token").toString(),
    'Content-Type': 'application/json'
  };

  static Future<dynamic> delete(int id) async {
    var url = Uri.parse("${baseUrl}delete/$id");

    var req = http.Request("DELETE", url);
    req.headers.addAll(headers);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode == 200) {
      return {"statusCode": 200, "detail": jsonDecode(resBody)["detail"]};
    } else if (res.statusCode == 422) {
      return {
        "statusCode": 422,
        "detail": jsonDecode(resBody)["detail"][0]["msg"]
      };
    } else if (res.statusCode == 401) {
      return {"statusCode": 401, "detail": jsonDecode(resBody)["detail"]};
    } else {
      return {"statusCode": 404, "detail": jsonDecode(resBody)["detail"]};
    }
  }

  static Future<dynamic> read(int id) async {
    var url = Uri.parse("${baseUrl}retreive/$id");

    var req = http.Request("GET", url);
    req.headers.addAll(headers);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return userRoleFromJson(resBody);
    } else {
      throw Exception(jsonDecode(resBody)["detail"]);
    }
  }
}
