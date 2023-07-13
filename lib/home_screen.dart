import 'package:flutter/material.dart';
import 'package:fyp_inventory/controller/baseController.dart';
import 'package:fyp_inventory/controller/userController.dart';
import 'package:fyp_inventory/models/user.dart';
import 'package:fyp_inventory/navigation_service.dart';
import 'package:lottie/lottie.dart';
import 'Custom WIdgets/CustomDrawertile.dart';
import 'Custom WIdgets/IconContainer.dart';
import 'GatePass/GatePassListview.dart';
import 'Item_Categories/ItemCategoiresListView.dart';
import 'Item_Type/ItemTypeListView.dart';
import 'Item_Unit/ItemUnitListView.dart';
import 'PurchaseOrder/PurchaseOrderListView.dart';
import 'PurchaseOrderItem/PurchaseOrderItemListView.dart';
import 'Tabviewpages/detailorderlistview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? data;
  var isLoaded = 0;
  var nav = NavigationService();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      data = await UserController.read();
      setState(() {
        isLoaded = 1;
      });
    } catch (e) {
      nav.routeTo("serverdown");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Visibility(
        visible: (isLoaded != 0),
        replacement: Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        child: Scaffold(
          drawer: Drawer(
            child: ListView(children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF004096)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Lottie.asset('animations/38435-register.json',
                        height: 70,
                        repeat: true,
                        reverse: true,
                        fit: BoxFit.cover),
                    Text(
                      (isLoaded == 1) ? data!.uName : "",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      (isLoaded == 1) ? data!.uEmail : "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    nav.routeTo("supplier");
                  },
                  child: CustomDrawerTile(title: 'Supplier')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ItemTypeListView()),
                    );
                  },
                  child: CustomDrawerTile(title: 'Item Type')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ItemUnitListView()),
                    );
                  },
                  child: CustomDrawerTile(title: 'Item Unit')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ItemCategoriesListView()),
                    );
                  },
                  child: CustomDrawerTile(title: 'Item Categories')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GatePassListview()),
                    );
                  },
                  child: CustomDrawerTile(title: 'Gate Pass')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PurchaseOrderListView()),
                    );
                  },
                  child: CustomDrawerTile(title: 'Purchase Order')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PurchaseOrderItemListView()),
                    );
                  },
                  child: CustomDrawerTile(title: 'Purchase Order Item')),
            ]),
          ),
          appBar: AppBar(
            backgroundColor: Color(0xFF004096).withOpacity(0.9),
            title: Text((isLoaded == 1) ? data!.uName : ""),
            actions: [
              IconButton(
                onPressed: () {
                  BaseController.getPrefs().remove("token");
                  nav.routeTo("login");
                },
                icon: Icon(Icons.login),
                padding: EdgeInsets.only(left: 50),
              ),
              Container(
                width: 20,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.lightBlueAccent.withOpacity(0.06),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_sharp,
                                    color: Colors.red,
                                    size: 17,
                                  ),
                                  Text(
                                    'Head Of Computer Science Department',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7),
                                child: Text(
                                    (isLoaded == 1) ? data!.ur.urTitle : ""),
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 4,
                    child: Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Purchase Orders',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailOrderListView()),
                                      );
                                    },
                                    child: IconContainer(
                                      iconname: Icons.pending_actions_rounded,
                                      title: 'Pending',
                                      colorbox: Colors.yellow,
                                    )),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailOrderListView()),
                                      );
                                    },
                                    child: IconContainer(
                                      iconname: Icons.done,
                                      title: 'Complete',
                                      colorbox: Colors.green,
                                    )),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailOrderListView()),
                                      );
                                    },
                                    child: IconContainer(
                                      iconname: Icons.delete_forever_outlined,
                                      title: 'Expire',
                                      colorbox: Colors.red,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 4,
                    child: Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'GRN',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailOrderListView()),
                                      );
                                    },
                                    child: IconContainer(
                                      iconname: Icons.home,
                                      title: 'Home',
                                      colorbox: Colors.red,
                                    )),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailOrderListView()),
                                      );
                                    },
                                    child: IconContainer(
                                      iconname: Icons.access_alarm,
                                      title: 'Home',
                                      colorbox: Colors.yellow,
                                    )),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailOrderListView()),
                                      );
                                    },
                                    child: IconContainer(
                                      iconname:
                                          Icons.accessibility_new_outlined,
                                      title: 'Home',
                                      colorbox: Colors.green,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF004096).withOpacity(0.9)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inventory_2_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Text(
                          'Inventory',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
