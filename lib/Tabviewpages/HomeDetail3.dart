import 'package:flutter/material.dart';

class HomeOrderDetail3 extends StatelessWidget {
  var listNO = [
    'F-3/55',
    'F-2/221',
    'F-1/489',
    'F-7/896',
    'F-4/751',
    'F-8/634',
    'F-3/943',
    'F-77/396',
    'F-5/865',
    'F-7/291'
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
                        color: Colors.red.withOpacity(0.9),
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
                        "Expired",
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
