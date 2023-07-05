import 'dart:convert';

import 'package:fyp_inventory/controller/url.dart';
import 'package:http/http.dart' as http;

import 'package:fyp_inventory/models/supplier.dart';

class SupplierController {
  static Future<dynamic> add(
      String suName, String suPhone, String? suEmail, String? suAddress) async {
    var supplier = Supplier(
      suName: suName,
      suPhone: suPhone,
      suEmail: suEmail,
      suAddress: suAddress,
    );

    var url = Uri.parse(await BaseUrl.get() + "/api/v1/supplier/");

    var req = http.Request("POST", url);
    req.headers.addAll({'Accept': '*/*', 'Content-Type': 'application/json'});
    req.body = supplierToJson(supplier);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return jsonDecode(resBody)["message"];
    } else {
      return res.reasonPhrase;
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

    var url = Uri.parse(await BaseUrl.get() + "/api/v1/supplier/update/" + id);

    var req = http.Request("PUT", url);
    req.headers.addAll({'Accept': '*/*', 'Content-Type': 'application/json'});
    req.body = supplierToJson(supplier);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return jsonDecode(resBody)["message"];
    } else {
      return res.reasonPhrase;
    }
  }

  Future<List<Supplier>?> readAll() async {
    var url = Uri.parse(await BaseUrl.get() + "/api/v1/supplier/all/");

    var req = http.Request("GET", url);
    req.headers.addAll({'Accept': '*/*', 'Content-Type': 'application/json'});

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return supplierFromJsonList(resBody);
    }
  }
}

void main(List<String> args) async {
  var re = await SupplierController.add("ggggg", "03177474409", "", "");
  print(re);
}
