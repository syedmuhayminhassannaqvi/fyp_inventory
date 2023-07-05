import 'package:flutter/material.dart';
import 'package:fyp_inventory/controller/supplierController.dart';
import 'package:fyp_inventory/models/supplier.dart';

import 'AddSupplier.dart';
import 'Supplier details.dart';

class Supplierlistview extends StatefulWidget {
  @override
  _SupplierlistviewState createState() => _SupplierlistviewState();
}

class _SupplierlistviewState extends State<Supplierlistview> {
  List<String> items = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grapes',
    'Honeydew',
    'Jackfruit',
    'Kiwi',
    'Lemon',
    'Mango',
    'Nectarine',
    'Orange',
    'Papaya',
    'Quince',
    'Raspberry',
    'Strawberry',
    'Watermelon',
  ];

  List<String> filteredItems = [];
  List<Supplier>? data;
  var isLoaded = false;

  @override
  void initState() {
    filteredItems = items;
    super.initState();
    getData();
  }

  getData() async{
    data = await SupplierController().readAll();
    if(data != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  void filterList(String query) {
    setState(() {
      filteredItems = items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF004096).withOpacity(0.9),
        centerTitle: true,
        title: Text(
          'Supplier',
          style: TextStyle(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Visibility(
          visible: isLoaded,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  onChanged: filterList,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SupplierDetial()),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 55,
                              color: Colors.white,
                            ),
                            Positioned(
                              top: 9,
                              child: Container(
                                width: 2,
                                height: 37,
                                color: Color(0xFF004096).withOpacity(0.9),
                              ),
                            ),
                            Positioned(
                              top: 13,
                              left: 20,
                              child: Text(
                                data![index].suName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 30,
                              left: 20,
                              child: Text(
                                data![index].suPhone,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            Positioned(
                              top: 16,
                              left: 370,
                              child: Text(
                                '88840',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF004096),
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF004096).withOpacity(0.9),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddSupplierPage(0)),
          );
        },
      ),
    );
  }
}
