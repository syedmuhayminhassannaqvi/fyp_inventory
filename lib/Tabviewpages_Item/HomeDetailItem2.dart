import 'package:flutter/material.dart';

class HomeOrderDetailItem2 extends StatelessWidget {
  var listNO = [
    'F-43/5563',
    'F-92/2231',
    'F-11/4289',
    'F-67/8496',
    'F-34/7541',
    'F-08/6234',
    'F-23/9943',
    'F-90/3496',
    'F-54/8865',
    'F-73/2981'
  ];
  var list_item = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list_item.length, // Number of items in the list
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Card(
              elevation: 2,
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
                        color: Colors.deepPurple.withOpacity(0.9),
                      )),
                  Positioned(
                      top: 13,
                      left: 20,
                      child: Text(
                        '${list_item[index]["item_unit"]}_${list_item[index]["i_title"]} - ${listNO[index]}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      )),
                  Positioned(
                      top: 30,
                      left: 20,
                      child: Text(
                        "Delivered: ${list_item[index]["sti_qty"]}",
                        style: TextStyle(fontSize: 12),
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
