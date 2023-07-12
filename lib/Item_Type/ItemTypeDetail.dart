import 'package:flutter/material.dart';
import 'package:fyp_inventory/controller/itemTypeController.dart';
import 'package:fyp_inventory/models/item_type.dart';
import 'package:fyp_inventory/navigation_service.dart';
import 'AddItemType.dart';

class ItemTypeDetail extends StatefulWidget {
  final int id;

  const ItemTypeDetail(this.id, {Key? key}) : super(key: key);

  @override
  State<ItemTypeDetail> createState() => _ItemTypeDetailState(id);
}

class _ItemTypeDetailState extends State<ItemTypeDetail> {
  final int id;
  ItemTypeAdd? data;
  var isLoaded = 0;
  var nav = NavigationService();

  _ItemTypeDetailState(this.id);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    try {
      data = await ItemTypeController.read(id);
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
          onPressed: () => nav.routeTo("itemtype"),
          icon: Icon(Icons.arrow_left_sharp),
          label: Text("Back"),
          style: ElevatedButton.styleFrom(
              elevation: 0, backgroundColor: Colors.transparent),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF004096).withOpacity(0.9),
        title: Text('Item Type Detail'),
      ),
      body: Visibility(
        visible: (isLoaded != 0),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: (isLoaded != 1)
            ? Center(
                child: Text(
                  "No Record of Item Type",
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
                          'Item Type Title',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(data!.itTitle),
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
                          'Item Type Description',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(data!.itDescription ??
                            "No Item Type Description Found"),
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
                              builder: (context) => AddItemType(
                                    1,
                                    itemTypeAdd: data,
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
