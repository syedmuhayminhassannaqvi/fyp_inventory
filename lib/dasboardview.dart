import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'datadetail.dart';
import 'login.dart';

class InventoryListPage extends StatefulWidget {
  @override
  _InventoryListPageState createState() => _InventoryListPageState();
}

class _InventoryListPageState extends State<InventoryListPage> {
  // Define the dropdown menu items

  // Define the currently selected dropdown item

  @override
  void initState() {
    super.initState();

    // Set the default selected dropdown item
    _selectedDropdownItem = _dropdownItems.first;
  }

  int _selectedIndex = 0;

  String? _selectedDropdownItem;
  final List<String> _dropdownItems = ['Option 1', 'Option 2', 'Option 3'];

  String search = '';
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select an option',
                    labelStyle: TextStyle(
                      color: Color(0xFF004096),
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xFF004096),
                        width: 1,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  value: _selectedDropdownItem,
                  items: _dropdownItems.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF004096),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedDropdownItem = value!;
                    });
                  },
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF004096),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      'Inventery Items',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: TextFormField(
                        controller: searchController,
                        onChanged: (String? value) {
                          print(value);
                          setState(() {
                            search = value.toString();
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Color(0xFF004096)),
                            hintText: "Search here",
                            fillColor: Colors.white,
                            hoverColor: Colors.blue[40],
                            isDense: true),
                      ),
                    ))
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount:
                      15, // Replace this with the actual length of your inventory list
                  itemBuilder: (context, index) {
                    String position = index.toString();
                    if (searchController.text.isEmpty) {
                      return Dismissible(
                        key: UniqueKey(),
                        confirmDismiss: (DismissDirection direction) async {
                          return await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Confirm"),
                                content: const Text(
                                    "Are you sure you wish to delete this item?"),
                                actions: <Widget>[
                                  ElevatedButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: const Text("DELETE")),
                                  ElevatedButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: const Text("CANCEL"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        background: Container(
                          color: Colors.red,
                          child: Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.white,
                          ),
                        ),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.horizontal) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Item is Deleted')));
                          }
                        },
                        onUpdate: null,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black),
                          ),
                          margin: EdgeInsets.all(8),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InventroyDetail()),
                              );
                            },
                            title: Text(
                              'Inventory Item ${index}',
                              style: TextStyle(color: Color(0xFF004096)),
                            ),
                            subtitle: Text('Item Description'),
                            trailing: GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: Lottie.asset(
                                    'animations/88983-edit-write-update.json',
                                    height: 250,
                                    repeat: true,
                                    reverse: true,
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (position
                        .toLowerCase()
                        .contains(searchController.text.toString())) {
                      return Dismissible(
                        key: UniqueKey(),
                        confirmDismiss: (DismissDirection direction) async {
                          return await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Confirm"),
                                content: const Text(
                                    "Are you sure you wish to delete this item?"),
                                actions: <Widget>[
                                  ElevatedButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: const Text("DELETE")),
                                  ElevatedButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: const Text("CANCEL"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        background: Container(
                          color: Colors.red,
                          child: Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.white,
                          ),
                        ),
                        secondaryBackground: Container(
                          color: Colors.blue,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.startToEnd) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Item is Deleted')));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Item to update')));
                          }
                        },
                        onUpdate: null,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black),
                          ),
                          margin: EdgeInsets.all(8),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InventroyDetail()),
                              );
                            },
                            title: Text(
                              'Inventory Item ${index}',
                              style: TextStyle(color: Color(0xFF004096)),
                            ),
                            subtitle: Text('Item Description'),
                            trailing: GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.edit,
                                  color: Color(0xFF004096),
                                )),
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
