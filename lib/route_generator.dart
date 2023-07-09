import 'package:flutter/material.dart';
import 'package:fyp_inventory/Supplier/supplierlistview.dart';
import 'package:fyp_inventory/home_screen.dart';
import 'package:fyp_inventory/login_page.dart';
import 'package:fyp_inventory/server_down.dart';
import 'package:fyp_inventory/splashscreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case 'serverdown':
        return MaterialPageRoute(builder: (context) => ServerDown());
      case 'homescreen':
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case 'login':
        return MaterialPageRoute(builder: (context) => LoginPage());
      case 'supplier':
        return MaterialPageRoute(builder: (context) => Supplierlistview());
      default:
        return MaterialPageRoute(
            builder: (context) => Material(
                  child: Center(
                    child: Text(
                        "You are not Allowed Access to ${settings.name}. Ask Admin for Permission"),
                  ),
                ));
    }
  }
}
