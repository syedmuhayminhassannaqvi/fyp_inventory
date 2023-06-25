import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseUrl {
  static String? url;

  static Future<dynamic> get() async {
    var uri = Uri.parse("https://nfc-iet-e-store.000webhostapp.com/");

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      url = jsonDecode(response.body).toString();
    } else {
      url = "Server is down";
    }
  }
}

//void main(List<String> args) async {
//  await BaseUrl.get();
//  print(BaseUrl.url);
//}
