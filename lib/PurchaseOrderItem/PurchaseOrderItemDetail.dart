import 'package:flutter/material.dart';

import 'AddPurchaseOrderItem.dart';



class PurchaseOrderItemDetail extends StatelessWidget {
  const PurchaseOrderItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF004096).withOpacity(0.9),
        title: Text('Purchase Order Item Detail'),
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
                title: Text('Purchase Order Id',style: TextStyle(
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
                title: Text('I ID',style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                subtitle: Text('131241'),

              ),
            ),
            Card(
              elevation: 3,
              child: ListTile(
                leading: CircleAvatar(
                    foregroundColor: Colors.purpleAccent,
                    child: Icon(Icons.location_on_sharp,color: Color(0xFF004096),)),
                title: Text('Purchase order Quantity',style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                subtitle: Text('Naqvi'),

              ),
            ),
            Card(
              elevation: 3,
              child: ListTile(
                leading: CircleAvatar(
                    foregroundColor: Colors.purpleAccent,
                    child: Icon(Icons.location_on_sharp,color: Color(0xFF004096),)),
                title: Text('Purchase Order Status',style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                subtitle: Text('No'),

              ),
            ),

            SizedBox(height: 5,),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  AddPurchaseOrderItem()),
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
