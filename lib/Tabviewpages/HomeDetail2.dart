import 'package:flutter/material.dart';

class HomeOrderDetail2 extends StatelessWidget {
  var listNO = [
    'F-3/5563',
    'F-2/2231',
    'F-1/4289',
    'F-7/8496',
    'F-4/7541',
    'F-8/6234',
    'F-3/9943',
    'F-77/3496',
    'F-5/8865',
    'F-7/2981'
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
                        color: Colors.green.withOpacity(0.9),
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
                        "Completed",
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
