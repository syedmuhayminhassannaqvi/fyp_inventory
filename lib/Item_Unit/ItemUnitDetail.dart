import 'package:flutter/material.dart';
import 'package:fyp_inventory/controller/itemUnitController.dart';
import 'package:fyp_inventory/models/item_unit.dart';
import 'package:fyp_inventory/navigation_service.dart';
import 'AddItemUnit.dart';

class ItemUnitDetail extends StatefulWidget {
  final int id;

  const ItemUnitDetail(this.id, {Key? key}) : super(key: key);

  @override
  State<ItemUnitDetail> createState() => _ItemUnitDetailState(id);
}

class _ItemUnitDetailState extends State<ItemUnitDetail> {
  final int id;
  ItemUnitAdd? data;
  var isLoaded = 0;
  var nav = NavigationService();

  _ItemUnitDetailState(this.id);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    try {
      data = await ItemUnitController.read(id);
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
          onPressed: () => nav.routeTo("itemunit"),
          icon: Icon(Icons.arrow_left_sharp),
          label: Text("Back"),
          style: ElevatedButton.styleFrom(
              elevation: 0, backgroundColor: Colors.transparent),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF004096).withOpacity(0.9),
        title: Text('Item Unit Detail'),
      ),
      body: Visibility(
        visible: (isLoaded != 0),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: (isLoaded != 1)
            ? Center(
                child: Text(
                  "No Record of Item Unit",
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
                          'Item Unit Title',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(data!.iuTitle),
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
                          'Item Unit Description',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(data!.iuDescription ??
                            "No Item Unit Description Found"),
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
                              builder: (context) => AddItemUnit(
                                    1,
                                    itemUnitAdd: data,
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
