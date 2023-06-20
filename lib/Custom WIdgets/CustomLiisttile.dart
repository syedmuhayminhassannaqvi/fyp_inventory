import 'package:flutter/material.dart';

class CustomListtile extends StatefulWidget {
  const CustomListtile({Key? key}) : super(key: key);

  @override
  State<CustomListtile> createState() => _CustomListtileState();
}

class _CustomListtileState extends State<CustomListtile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Card(
        elevation: 30,
        child: Stack(
          children: [
            Container(width: double.infinity,height: 55,color: Colors.white,),
            Positioned(
                top: 9,
                child: Container(width: 3,height: 37,color: Color(0xFF004096).withOpacity(0.9),)),
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
  }
}
