import 'package:flutter/material.dart';
import 'package:fyp_inventory/Tabviewpages_Item/detailorderlistviewitem.dart';
import 'package:fyp_inventory/controller/baseController.dart';
import 'package:fyp_inventory/controller/userController.dart';
import 'package:fyp_inventory/controller/userRoleController.dart';
import 'package:fyp_inventory/models/user.dart';
import 'package:fyp_inventory/models/user_role.dart';
import 'package:fyp_inventory/navigation_service.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:lottie/lottie.dart';
import 'Custom WIdgets/CustomDrawertile.dart';
import 'Custom WIdgets/IconContainer.dart';
import 'Tabviewpages/detailorderlistview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? data;
  UserRole? role;

  var isLoaded = 0;
  var nav = NavigationService();

  HawkFabMenuController hawkFabMenuController = HawkFabMenuController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      data = await UserController.read();
      role = await UserRoleController.read(data!.ur.id);
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
                    if (isLoaded == 1) {
                      if (role!.suRw == 10 || role!.suRw == 11) {
                        nav.routeTo("supplier");
                      } else {
                        nav.routeTo("", args: "Supplier");
                      }
                    }
                  },
                  child: CustomDrawerTile(
                    title: 'Supplier',
                    icon: (isLoaded == 1)
                        ? ((role!.suRw == 10 || role!.suRw == 11)
                            ? Icons.lock_open
                            : Icons.lock)
                        : Icons.lock,
                  )),
              GestureDetector(
                  onTap: () {
                    if (isLoaded == 1) {
                      if (role!.itRw == 10 || role!.itRw == 11) {
                        nav.routeTo("itemtype");
                      } else {
                        nav.routeTo("", args: "Item Type");
                      }
                    }
                  },
                  child: CustomDrawerTile(
                    title: 'Item Type',
                    icon: (isLoaded == 1)
                        ? ((role!.itRw == 10 || role!.itRw == 11)
                            ? Icons.lock_open
                            : Icons.lock)
                        : Icons.lock,
                  )),
              GestureDetector(
                  onTap: () {
                    if (isLoaded == 1) {
                      if (role!.iuRw == 10 || role!.iuRw == 11) {
                        nav.routeTo("itemunit");
                      } else {
                        nav.routeTo("", args: "Item Unit");
                      }
                    }
                  },
                  child: CustomDrawerTile(
                    title: 'Item Unit',
                    icon: (isLoaded == 1)
                        ? ((role!.iuRw == 10 || role!.iuRw == 11)
                            ? Icons.lock_open
                            : Icons.lock)
                        : Icons.lock,
                  )),
              GestureDetector(
                  onTap: () {
                    if (isLoaded == 1) {
                      if (role!.icRw == 10 || role!.icRw == 11) {
                        nav.routeTo("itemcategory");
                      } else {
                        nav.routeTo("", args: "Item Category");
                      }
                    }
                  },
                  child: CustomDrawerTile(
                    title: 'Item Categories',
                    icon: (isLoaded == 1)
                        ? ((role!.icRw == 10 || role!.icRw == 11)
                            ? Icons.lock_open
                            : Icons.lock)
                        : Icons.lock,
                  )),
              GestureDetector(
                  onTap: () {
                    if (isLoaded == 1) {
                      if (role!.gpRw == 10 || role!.gpRw == 11) {
                        nav.routeTo("gatepass");
                      } else {
                        nav.routeTo("", args: "Gate Pass");
                      }
                    }
                  },
                  child: CustomDrawerTile(
                    title: 'Gate Pass',
                    icon: (isLoaded == 1)
                        ? ((role!.gpRw == 10 || role!.gpRw == 11)
                            ? Icons.lock_open
                            : Icons.lock)
                        : Icons.lock,
                  )),
              GestureDetector(
                  onTap: () {
                    if (isLoaded == 1) {
                      if (role!.gpRw == 10 || role!.gpRw == 11) {
                        nav.routeTo("po");
                      } else {
                        nav.routeTo("", args: "Purchase Order");
                      }
                    }
                  },
                  child: CustomDrawerTile(
                    title: 'Purchase Order',
                    icon: (isLoaded == 1)
                        ? ((role!.poRw == 10 || role!.poRw == 11)
                            ? Icons.lock_open
                            : Icons.lock)
                        : Icons.lock,
                  )),
              GestureDetector(
                  onTap: () {
                    if (isLoaded == 1) {
                      if (role!.poiRw == 10 || role!.poiRw == 11) {
                        nav.routeTo("poi");
                      } else {
                        nav.routeTo("", args: "Purchase Order Item");
                      }
                    }
                  },
                  child: CustomDrawerTile(
                    title: 'Purchase Order Item',
                    icon: (isLoaded == 1)
                        ? ((role!.poiRw == 10 || role!.poiRw == 11)
                            ? Icons.lock_open
                            : Icons.lock)
                        : Icons.lock,
                  )),
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
          body: HawkFabMenu(
            openIcon: Icons.add,
            closeIcon: Icons.close,
            items: [
              HawkFabMenuItem(
                label: 'User',
                ontap: () {
                  if (role!.uRw == 1 || role!.uRw == 11) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('User Creation')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('You are Unauthorized to Create Users')),
                    );
                  }
                },
                icon: Icon((isLoaded == 1)
                    ? (role!.uRw == 1 || role!.uRw == 11)
                        ? Icons.person_add
                        : Icons.lock
                    : Icons.lock),
                color: Colors.black,
              ),
              HawkFabMenuItem(
                label: 'Supplier',
                ontap: () {
                  if (role!.suRw == 1 || role!.suRw == 11) {
                    nav.routeTo('supplieradd', args: 0);
                  } else {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('You are Unauthorized to Create Supplier')),
                    );
                  }
                },
                icon: Icon((isLoaded == 1)
                    ? (role!.suRw == 1 || role!.suRw == 11)
                        ? Icons.shop_two
                        : Icons.lock
                    : Icons.lock),
                color: Colors.black,
              )
            ],
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
                              child: Center(
                                  child: Text("No Notification!",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)))),
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
                                                  DetailOrderListView(0)),
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
                                                  DetailOrderListView(1)),
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
                                                  DetailOrderListView(2)),
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
                                'Current Puschase Order Items',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailOrderListViewItem(0)),
                                        );
                                      },
                                      child: IconContainer(
                                        iconname: Icons.pending_actions,
                                        title: 'Pending',
                                        colorbox: Colors.yellow,
                                      )),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailOrderListViewItem(1)),
                                        );
                                      },
                                      child: IconContainer(
                                        iconname: Icons.done,
                                        title: 'Complete',
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
                    GestureDetector(
                      onTap: () {
                        nav.routeTo("inventory");
                      },
                      child: Container(
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
