import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseUrl {
  static Future<dynamic> get() async {
    var uri = Uri.parse("https://nfc-iet-e-store.000webhostapp.com/");

    var req = http.Request("GET", uri);
    req.headers.addAll({'Accept': '*/*', 'Content-Type': 'application/json'});

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return jsonDecode(resBody);
    }
  }
}

void main(List<String> args) async {
  print(await BaseUrl.get());
}
