import 'package:flutter/material.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  var data = [
    {
      "i_title": "HDMI Cable",
      "it_id": 0,
      "iu_id": 0,
      "ic_id": 0,
      "id": 0,
      "item_type": {"it_title": "electronics"},
      "item_unit": "50m",
      "item_category": {"ic_title": "consumable"},
      "poi_qty": 20,
      "sti_qty": 9
    },
    {
      "i_title": "Board Marker",
      "it_id": 1,
      "iu_id": 1,
      "ic_id": 1,
      "id": 1,
      "item_type": {"it_title": "grocery"},
      "item_unit": "Box",
      "item_category": {"ic_title": "non-consumable"},
      "poi_qty": 9,
      "sti_qty": 4
    },
    {
      "i_title": "Surf Excel",
      "it_id": 2,
      "iu_id": 2,
      "ic_id": 2,
      "id": 2,
      "item_type": {"it_title": "cleaning"},
      "item_unit": "1kg",
      "item_category": {"ic_title": "non-consumable"},
      "poi_qty": 5,
      "sti_qty": 3
    },
    {
      "i_title": "Chairs",
      "it_id": 3,
      "iu_id": 3,
      "ic_id": 3,
      "id": 3,
      "item_type": {"it_title": "grocery"},
      "item_unit": "No",
      "item_category": {"ic_title": "consumable"},
      "poi_qty": 8,
      "sti_qty": 2
    },
    {
      "i_title": "Core i5 - 5 Generation",
      "it_id": 4,
      "iu_id": 4,
      "ic_id": 4,
      "id": 4,
      "item_type": {"it_title": "electronics"},
      "item_unit": "No",
      "item_category": {"ic_title": "consumable"},
      "poi_qty": 6,
      "sti_qty": 4
    },
    {
      "i_title": "VGA Cable",
      "it_id": 0,
      "iu_id": 0,
      "ic_id": 0,
      "id": 0,
      "item_type": {"it_title": "electronics"},
      "item_unit": "50m",
      "item_category": {"ic_title": "consumable"},
      "poi_qty": 20,
      "sti_qty": 9
    },
    {
      "i_title": "White Board",
      "it_id": 1,
      "iu_id": 1,
      "ic_id": 1,
      "id": 1,
      "item_type": {"it_title": "grocery"},
      "item_unit": "No",
      "item_category": {"ic_title": "non-consumable"},
      "poi_qty": 9,
      "sti_qty": 4
    },
    {
      "i_title": "Harpic Cleaner",
      "it_id": 2,
      "iu_id": 2,
      "ic_id": 2,
      "id": 2,
      "item_type": {"it_title": "cleaning"},
      "item_unit": "250ml",
      "item_category": {"ic_title": "non-consumable"},
      "poi_qty": 5,
      "sti_qty": 3
    },
    {
      "i_title": "Tables",
      "it_id": 3,
      "iu_id": 3,
      "ic_id": 3,
      "id": 3,
      "item_type": {"it_title": "grocery"},
      "item_unit": "No",
      "item_category": {"ic_title": "consumable"},
      "poi_qty": 8,
      "sti_qty": 2
    },
    {
      "i_title": "Hp Curved LED",
      "it_id": 4,
      "iu_id": 4,
      "ic_id": 4,
      "id": 4,
      "item_type": {"it_title": "electronics"},
      "item_unit": "No",
      "item_category": {"ic_title": "consumable"},
      "poi_qty": 6,
      "sti_qty": 4
    },
  ];
  var filteredData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredData = data;
  }

  void filterList(String query) {
    setState(() {
      if (query.trim() != "") {
        filteredData = data
            .where((member) => member["i_title"]
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
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
        backgroundColor: Color(0xFF004096).withOpacity(0.9),
        centerTitle: true,
        title: Text("Inventory"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                itemCount: filteredData.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    child: GestureDetector(
                      onTap: () {},
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
                              filteredData![index]["i_title"],
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
                              "Quantity: ${filteredData![index]["poi_qty"]}",
                              style: TextStyle(fontSize: 12),
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
      ),
    );
  }
}
