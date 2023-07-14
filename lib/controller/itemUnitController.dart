import 'dart:convert';

import 'package:fyp_inventory/controller/baseController.dart';
import 'package:http/http.dart' as http;

import 'package:fyp_inventory/models/item_unit.dart';

class ItemUnitController {
  static var prefs = BaseController.getPrefs();
  static var baseUrl = "${prefs.getString("baseUrl")}/api/v1/item_unit/";
  static var headers = {
    'Accept': '*/*',
    'Authorization': prefs.getString("token").toString(),
    'Content-Unit': 'application/json'
  };

  static Future<dynamic> add(String iuTitle, String? iuDescription) async {
    var itemUnit = ItemUnitAdd(
      iuTitle: iuTitle,
      iuDescription: iuDescription,
    );

    var url = Uri.parse(baseUrl);

    var req = http.Request("POST", url);
    req.headers.addAll(headers);
    req.body = itemUnitAddToJson(itemUnit);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode == 201) {
      return {"statusCode": 201, "detail": jsonDecode(resBody)["detail"]};
    } else if (res.statusCode == 422) {
      return {
        "statusCode": 422,
        "detail": jsonDecode(resBody)["detail"][0]["msg"]
      };
    } else if (res.statusCode == 401) {
      return {"statusCode": 401, "detail": jsonDecode(resBody)["detail"]};
    } else {
      return {"statusCode": 409, "detail": jsonDecode(resBody)["detail"]};
    }
  }

  static Future<dynamic> update(
      String id, String iuTitle, String? iuDescription) async {
    var itemUnit = ItemUnitAdd(
      iuTitle: iuTitle,
      iuDescription: iuDescription,
    );

    var url = Uri.parse("${baseUrl}update/$id");

    var req = http.Request("PUT", url);
    req.headers.addAll(headers);
    req.body = itemUnitAddToJson(itemUnit);

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
      return {"statusCode": 409, "detail": jsonDecode(resBody)["detail"]};
    }
  }

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

    if (res.statusCode == 200) {
      return itemUnitAddFromJson(resBody);
    } else {
      throw Exception(jsonDecode(resBody)["detail"]);
    }
  }

  static Future<List<ItemUnit>> readAll() async {
    var url = Uri.parse("${baseUrl}all/");

    var req = http.Request("GET", url);
    req.headers.addAll(headers);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode == 200) {
      return itemUnitFromJsonList(resBody);
    } else {
      return <ItemUnit>[];
    }
  }
}
