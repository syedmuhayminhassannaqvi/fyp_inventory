import 'package:flutter/material.dart';

class HomeOrderDetail extends StatelessWidget {
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
  var list_supplier = [
    {"id": 1, "su_name": "statiss", "su_phone": "+923166464408"},
    {"id": 11, "su_name": "store", "su_phone": "+923556464802"},
    {"id": 13, "su_name": "naqvi depart store", "su_phone": "+923166464402"},
    {"id": 19, "su_name": "metro", "su_phone": "+9231646464645"},
    {"id": 2, "su_name": "chemical store", "su_phone": "+923166464408"},
    {"id": 3, "su_name": "chemistry magic store", "su_phone": "+923166464408"},
    {"id": 4, "su_name": "ideal super mart", "su_phone": "+923166464408"},
    {"id": 5, "su_name": "computer supplier", "su_phone": "+923166464408"},
    {"id": 20, "su_name": "ayesha beauty store", "su_phone": "+923166464408"},
    {"id": 22, "su_name": "nawaz and sons", "su_phone": "+923166464408"}
  ];

  var list_date = [
    '2023-08-02',
    '2024-01-13',
    '2023-12-24',
    '2023-09-15',
    '2024-07-05',
    '2024-03-31',
    '2023-10-12',
    '2023-09-29',
    '2024-06-29',
    '2024-03-25'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listNO.length, // Number of items in the list
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
                        '${listNO[index]} _ ${list_supplier[index]['su_name']}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      )),
                  Positioned(
                      top: 30,
                      left: 20,
                      child: Text(
                        "Delivery Date: ${list_date[index]}",
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
