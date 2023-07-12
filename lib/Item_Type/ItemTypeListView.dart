import 'package:flutter/material.dart';
import 'package:fyp_inventory/controller/itemTypeController.dart';
import 'package:fyp_inventory/models/item_type.dart';
import 'package:fyp_inventory/navigation_service.dart';

class ItemTypeListView extends StatefulWidget {
  @override
  _ItemTypeListViewState createState() => _ItemTypeListViewState();
}

class _ItemTypeListViewState extends State<ItemTypeListView> {
  List<ItemType>? filteredData;
  List<ItemType>? data;
  var isLoaded = 0;
  var nav = NavigationService();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    data = await ItemTypeController.readAll();
    if (data != null && data != []) {
      setState(() {
        filteredData = data;
        isLoaded = 1;
      });
    } else {
      setState(() {
        isLoaded = 2;
      });
    }
  }

  _delete(int index) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Are you sure?"),
              content: Text("You want to delete item type"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("No"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red)),
                ElevatedButton(
                    onPressed: () async {
                      var res = await ItemTypeController.delete(
                          filteredData![index].id);

                      if (res["statusCode"] == 401) {
                        NavigationService().routeTo("", args: res["detail"]);
                      } else if (res["statusCode"] == 404 ||
                          res["statusCode"] == 422) {
                        SnackBar(content: Text(res["detail"]));
                      } else {
                        setState(() {
                          data!.removeAt(index);
                          filteredData = data;
                          Navigator.pop(context);
                          SnackBar(content: Text(res["detail"]));
                        });
                      }
                    },
                    child: Text("Yes"))
              ],
            ));
  }

  void filterList(String query) {
    setState(() {
      if (query.trim() != "") {
        filteredData = data!
            .where((member) =>
                member.itTitle.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredData = data;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => nav.routeTo("homescreen"),
          icon: Icon(Icons.arrow_left_sharp),
          label: Text("Back"),
          style: ElevatedButton.styleFrom(
              elevation: 0, backgroundColor: Colors.transparent),
        ),
        backgroundColor: Color(0xFF004096).withOpacity(0.9),
        centerTitle: true,
        title: Text('Item Type'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Visibility(
          visible: (isLoaded != 0),
          child: (isLoaded != 1)
              ? Center(
                  child: Text(
                    "No Record of Item Type",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
              : Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        onChanged: (value) {
                          filterList(value);
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredData?.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 3,
                            child: GestureDetector(
                              onTap: () {
                                nav.routeTo('itemtypedetail',
                                    args: filteredData![index].id);
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
                                      filteredData![index].itTitle,
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
                                      filteredData![index].itDescription ?? "",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Positioned(
                                      top: 16,
                                      left: 370,
                                      child: IconButton.filled(
                                          onPressed: () => _delete(index),
                                          icon: Icon(
                                              Icons.delete_forever_outlined))),
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
          nav.routeTo('itemtypeadd', args: 0);
        },
      ),
    );
  }
}
