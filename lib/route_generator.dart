import 'package:flutter/material.dart';
import 'package:fyp_inventory/Item_Type/AddItemType.dart';
import 'package:fyp_inventory/Item_Type/ItemTypeDetail.dart';
import 'package:fyp_inventory/Item_Type/ItemTypeListView.dart';
import 'package:fyp_inventory/Item_Unit/AddItemUnit.dart';
import 'package:fyp_inventory/Item_Unit/ItemUnitDetail.dart';
import 'package:fyp_inventory/Item_Unit/ItemUnitListView.dart';
import 'package:fyp_inventory/Supplier/add_supplier.dart';
import 'package:fyp_inventory/Supplier/supplier_details.dart';
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
      case 'supplierdetail':
        return MaterialPageRoute(
            builder: (context) =>
                SupplierDetial(int.parse(settings.arguments.toString())));
      case 'supplieradd':
        return MaterialPageRoute(
            builder: (context) =>
                AddSupplierPage(int.parse(settings.arguments.toString())));
      case 'itemtype':
        return MaterialPageRoute(builder: (context) => ItemTypeListView());
      case 'itemtypedetail':
        return MaterialPageRoute(
            builder: (context) =>
                ItemTypeDetail(int.parse(settings.arguments.toString())));
      case 'itemtypeadd':
        return MaterialPageRoute(
            builder: (context) =>
                AddItemType(int.parse(settings.arguments.toString())));
      case 'itemunit':
        return MaterialPageRoute(builder: (context) => ItemUnitListView());
      //case 'itemunitdetail':
      //  return MaterialPageRoute(
      //      builder: (context) =>
      //          ItemUnitDetail(int.parse(settings.arguments.toString())));
      //case 'itemunitadd':
      //  return MaterialPageRoute(
      //      builder: (context) =>
      //          AddUnitType(int.parse(settings.arguments.toString())));
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    backgroundColor: Color(0xFF004096).withOpacity(0.9),
                    centerTitle: true,
                    title: Text("Unauthorized"),
                  ),
                  body: Center(
                    child: Text("${settings.arguments}"),
                  ),
                ));
    }
  }
}
