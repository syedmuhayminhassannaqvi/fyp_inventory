import 'package:flutter/material.dart';

import 'AddItemUnit.dart';


class ItemUnitDetail extends StatelessWidget {
  const ItemUnitDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF004096).withOpacity(0.9),
        title: Text('Item Unit Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Card(
              elevation: 3,
              child: ListTile(
                leading: CircleAvatar(
                    foregroundColor: Colors.purpleAccent,
                    child: Icon(Icons.accessibility_new_outlined,color: Color(0xFF004096),)),
                title: Text('Name',style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                subtitle: Text('Muhaymin'),

              ),
            ),
            Card(
              elevation: 3,
              child: ListTile(
                leading: CircleAvatar(
                    foregroundColor: Colors.purpleAccent,
                    child: Icon(Icons.location_on_sharp,color: Color(0xFF004096),)),
                title: Text('Address',style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                subtitle: Text('house 4, street no 12, T block, New multan Colony Multan'),

              ),
            ),
            SizedBox(height: 5,),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  AddUnitType()),
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                child: Center(
                  child: Text('Update Data',style: TextStyle(
                    color: Colors.white,
                  ),),
                ),
                decoration: BoxDecoration(
                    color: Color(0xFF004096).withOpacity(0.9),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0), // Specify the desired radius for the top left corner
                      bottomLeft: Radius.circular(20.0)
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
