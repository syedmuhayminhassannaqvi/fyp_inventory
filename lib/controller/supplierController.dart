import 'dart:convert';

import 'package:fyp_inventory/controller/baseController.dart';
import 'package:http/http.dart' as http;

import 'package:fyp_inventory/models/supplier.dart';

class SupplierController {
  static var prefs = BaseController.getPrefs();
  static var baseUrl = "${prefs.getString("baseUrl")}/api/v1/supplier/";
  static var headers = {
    'Accept': '*/*',
    'Authorization': prefs.getString("token").toString(),
    'Content-Type': 'application/json'
  };

  static Future<dynamic> add(
      String suName, String suPhone, String? suEmail, String? suAddress) async {
    var supplier = SupplierAdd(
      suName: suName,
      suPhone: suPhone,
      suEmail: suEmail,
      suAddress: suAddress,
    );

    var url = Uri.parse(baseUrl);

    var req = http.Request("POST", url);
    req.headers.addAll(headers);
    req.body = supplierAddToJson(supplier);

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

  static Future<dynamic> update(String id, String suName, String suPhone,
      String? suEmail, String? suAddress) async {
    var supplier = SupplierAdd(
      suName: suName,
      suPhone: suPhone,
      suEmail: suEmail,
      suAddress: suAddress,
    );

    var url = Uri.parse("${baseUrl}update/$id");

    var req = http.Request("PUT", url);
    req.headers.addAll(headers);
    req.body = supplierAddToJson(supplier);

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

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return supplierAddFromJson(resBody);
    } else {
      throw Exception(jsonDecode(resBody)["detail"]);
    }
  }

  static Future<List<Supplier>> readAll() async {
    var url = Uri.parse("${baseUrl}all/");

    var req = http.Request("GET", url);
    req.headers.addAll(headers);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return supplierFromJsonList(resBody);
    } else {
      return <Supplier>[];
    }
  }
}
