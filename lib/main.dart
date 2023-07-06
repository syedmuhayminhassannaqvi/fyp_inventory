import 'package:flutter/material.dart';
import 'package:fyp_inventory/Supplier/supplierlistview.dart';
import 'package:fyp_inventory/controller/baseController.dart';
import 'package:fyp_inventory/controller/url.dart';
import 'package:fyp_inventory/server_down.dart';
import 'package:fyp_inventory/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:fyp_inventory/updatedata.dart';
//import 'AddData.dart';
//import 'Custom WIdgets/CustomDrawertile.dart';
//import 'Custom WIdgets/CustomLiisttile.dart';
//import 'Custom WIdgets/IconContainer.dart';
//import 'GatePass/AddGatePass.dart';
//import 'GatePass/GatePassListview.dart';
//import 'PurchaseOrder/AddPurchaseOrder.dart';
//import 'PurchaseOrder/PurchaseOrderListView.dart';
//import 'PurchaseOrderItem/PurchaseOrderItemListView.dart';
//import 'Supplier/AddSupplier.dart';
//import 'Supplier/Supplier details.dart';
//import 'Supplier/supplierlistview.dart';
//import 'Tabviewpages/HomeDetail.dart';
//import 'bottomnav.dart';
//import 'dasboardview.dart';
//import 'datadetail.dart';
//import 'Tabviewpages/detailorderlistview.dart';
//import 'home screen.dart';
//import 'login.dart';

void main() async {
  final prefs = await SharedPreferences.getInstance();
  BaseController.setPrefs(prefs);

  prefs.setString("baseUrl", await BaseUrl.get() + "/api/v1");

  runApp(MaterialApp(
    //home: IconContainer(),
    //home: HomeScreen(),
    //home: SupplierDetial(),
    //home: CustomDrawerTile(),
    //home: DetailOrderListView(),
    //home: CustomListtile(),
    //home: HomeOrderDetail(),
    //home: SplashScreen(),
    //home: GatePassListview(),
    home: (prefs.getString("baseUrl") ?? "Server is down") == "Server is down"
        ? ServerDown()
        : prefs.getString("token") == null
            ? SplashScreen()
            : Supplierlistview(),
    //home: AddSupplierPage(),
    //home: PurchaseOrderItemListView(),
    //home: InventoryListPage(),
    //home: InventroyDetail(),
    //home: AddData(),
    //home: BottomNav(),
  ));
}
