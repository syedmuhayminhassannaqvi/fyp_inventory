import 'package:flutter/material.dart';
import 'package:fyp_inventory/Item_Categories/ItemCategoiresListView.dart';
import 'package:fyp_inventory/PurchaseOrder/PurchaseOrderListView.dart';
import 'package:fyp_inventory/Supplier/supplierlistview.dart';
import 'package:fyp_inventory/controller/baseController.dart';
import 'package:fyp_inventory/controller/url.dart';
import 'package:fyp_inventory/navigation_service.dart';
import 'package:fyp_inventory/route_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';

<<<<<<< HEAD
=======
import 'UsersDetail/AddUser.dart';
import 'home_screen.dart';

import 'UsersDetail/AddUser.dart';
import 'UsersDetail/UsersListview.dart';

>>>>>>> 52127dd101371c69da7aca0d99151d422f39ac6f
Future<String> initRoute(bool serverDown, var prefs) async {
  if (serverDown) {
    return 'serverdown';
  } else {
    return prefs.getString("token") == null ||
            await BaseController.checkAuthorization()
        ? '/'
        : 'homescreen';
  }
}

void main() async {
  final prefs = await SharedPreferences.getInstance();
  BaseController.setPrefs(prefs);
  var serverDown = false;

  try {
    prefs.setString("baseUrl", await BaseUrl.get());
  } catch (e) {
    serverDown = true;
  } finally {
    runApp(MyApp(initRoute: await initRoute(serverDown, prefs)));
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, this.initRoute});

  final String? initRoute;

  @override
  State<MyApp> createState() => _MyAppState(initRoute);
}

class _MyAppState extends State<MyApp> {
  final String? initRoute;

  _MyAppState(this.initRoute);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NFC IET Store Management System",
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoutes,
      initialRoute: initRoute,
      navigatorKey: NavigationService.navigatorKey,
    );
  }
}
<<<<<<< HEAD
=======




// void main(){
//   runApp(MaterialApp(
//     home: PurchaseOrderListView(),
//   ));
// }
>>>>>>> 52127dd101371c69da7aca0d99151d422f39ac6f
