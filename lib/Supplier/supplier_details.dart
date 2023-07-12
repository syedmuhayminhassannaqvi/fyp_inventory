import 'package:flutter/material.dart';
import 'package:fyp_inventory/controller/supplierController.dart';
import 'package:fyp_inventory/models/supplier.dart';
import 'package:fyp_inventory/navigation_service.dart';
import 'add_supplier.dart';

class SupplierDetial extends StatefulWidget {
  final int id;

  const SupplierDetial(this.id, {Key? key}) : super(key: key);

  @override
  State<SupplierDetial> createState() => _SupplierDetialState(id);
}

class _SupplierDetialState extends State<SupplierDetial> {
  final int id;
  SupplierAdd? data;
  var isLoaded = 0;
  var nav = NavigationService();

  _SupplierDetialState(this.id);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    try {
      data = await SupplierController.read(id);
      setState(() {
        isLoaded = 1;
      });
    } catch (e) {
      setState(() {
        isLoaded = 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => nav.routeTo("supplier"),
          icon: Icon(Icons.arrow_left_sharp),
          label: Text("Back"),
          style: ElevatedButton.styleFrom(
              elevation: 0, backgroundColor: Colors.transparent),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF004096).withOpacity(0.9),
        title: Text('Supplier Detail'),
      ),
      body: Visibility(
        visible: (isLoaded != 0),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: (isLoaded != 1)
            ? Center(
                child: Text(
                  "No Record of Supplier",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Card(
                      elevation: 3,
                      child: ListTile(
                        leading: CircleAvatar(
                            foregroundColor: Colors.purpleAccent,
                            child: Icon(
                              Icons.accessibility_new_outlined,
                              color: Color(0xFF004096),
                            )),
                        title: Text(
                          'Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(data!.suName),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: ListTile(
                        leading: CircleAvatar(
                            foregroundColor: Colors.purpleAccent,
                            child: Icon(
                              Icons.phone_android,
                              color: Color(0xFF004096),
                            )),
                        title: Text(
                          'Phone',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(data!.suPhone),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: ListTile(
                        leading: CircleAvatar(
                            foregroundColor: Colors.purpleAccent,
                            child: Icon(
                              Icons.mail_lock_outlined,
                              color: Color(0xFF004096),
                            )),
                        title: Text(
                          'Email',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(data!.suEmail ?? "No Email Found"),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: ListTile(
                        leading: CircleAvatar(
                            foregroundColor: Colors.purpleAccent,
                            child: Icon(
                              Icons.location_on_sharp,
                              color: Color(0xFF004096),
                            )),
                        title: Text(
                          'Address',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(data!.suAddress ?? "No Address Found"),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddSupplierPage(
                                    1,
                                    supplierAdd: data,
                                    id: id,
                                  )),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Update Data',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFF004096).withOpacity(0.9),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(
                                    20.0), // Specify the desired radius for the top left corner
                                bottomLeft: Radius.circular(20.0))),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
