import 'package:flutter/material.dart';

import '../Custom WIdgets/CustomLiisttile.dart';

class HomeOrderDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10, // Number of items in the list
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Card(
              elevation: 2,
              child: Stack(
                children: [
                  Container(width: double.infinity,height: 55,color: Colors.white,),
                  Positioned(
                      top: 9,
                      child: Container(width: 2,height: 37,color: Colors.deepPurple.withOpacity(0.9),)),
                  Positioned(
                      top: 13,
                      left: 20,
                      child: Text('Title of SKU _ Pack of 100',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                      ),)),
                  Positioned(
                      top: 30,
                      left: 20,
                      child: Text('SKU883995',style: TextStyle(
                          fontSize: 12
                      ),)),
                  Positioned(
                      top: 16,
                      left: 370,
                      child: Text('88840',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF004096),
                          fontSize: 13
                      ),)),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
