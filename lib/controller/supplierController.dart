import 'dart:convert';

import 'package:fyp_inventory/controller/baseController.dart';
import 'package:http/http.dart' as http;

import 'package:fyp_inventory/models/supplier.dart';

class SupplierController {
  static var prefs = BaseController.getPrefs();
  static var baseUrl = "${prefs.getString("baseUrl")}supplier/";
  static var headers = {
    'Accept': '*/*',
    'Authorization': prefs.getString("token").toString(),
    'Content-Type': 'application/json'
  };

  static Future<dynamic> add(
      String suName, String suPhone, String? suEmail, String? suAddress) async {
    var supplier = Supplier(
      suName: suName,
      suPhone: suPhone,
      suEmail: suEmail,
      suAddress: suAddress,
    );

    var url = Uri.parse(baseUrl);

    var req = http.Request("POST", url);
    req.headers.addAll(headers);
    req.body = supplierToJson(supplier);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return jsonDecode(resBody)["message"];
    } else if (res.statusCode == 422) {
      return jsonDecode(resBody)["detail"][0]["msg"];
    } else {
      return jsonDecode(resBody)["detail"];
    }
  }

  static Future<dynamic> update(String id, String suName, String suPhone,
      String? suEmail, String? suAddress) async {
    var supplier = Supplier(
      suName: suName,
      suPhone: suPhone,
      suEmail: suEmail,
      suAddress: suAddress,
    );

    var url = Uri.parse("${baseUrl}update/$id");

    var req = http.Request("PUT", url);
    req.headers.addAll(headers);
    req.body = supplierToJson(supplier);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return jsonDecode(resBody)["message"];
    } else if (res.statusCode == 422) {
      return jsonDecode(resBody)["detail"][0]["msg"];
    } else {
      return jsonDecode(resBody)["detail"];
    }
  }

  Future<List<Supplier>?> readAll() async {
    var url = Uri.parse("${baseUrl}all/");

    var req = http.Request("GET", url);
    req.headers.addAll(headers);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return jsonDecode(resBody)["message"];
    } else if (res.statusCode == 422) {
      return jsonDecode(resBody)["detail"][0]["msg"];
    } else {
      return jsonDecode(resBody)["detail"];
    }
  }
}
