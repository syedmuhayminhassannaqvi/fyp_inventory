import 'package:flutter/material.dart';

import 'AddPurchaseOrder.dart';



class PurchaseOrderDetail extends StatelessWidget {
  const PurchaseOrderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF004096).withOpacity(0.9),
        title: Text('Purchase Order Detail'),
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
                title: Text('Supplier Name',style: TextStyle(
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
                title: Text('Purchase order ID',style: TextStyle(
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
                title: Text('Purchase order name',style: TextStyle(
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
            Card(
              elevation: 3,
              child: ListTile(
                leading: CircleAvatar(
                    foregroundColor: Colors.purpleAccent,
                    child: Icon(Icons.location_on_sharp,color: Color(0xFF004096),)),
                title: Text('Delivery Date',style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                subtitle: Text('11-11-11'),

              ),
            ),
            Card(
              elevation: 3,
              child: ListTile(
                leading: CircleAvatar(
                    foregroundColor: Colors.purpleAccent,
                    child: Icon(Icons.location_on_sharp,color: Color(0xFF004096),)),
                title: Text('Purchase Order Date',style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                subtitle: Text('11-11-11'),

              ),
            ),
            SizedBox(height: 5,),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  AddPurchaseOrder()),
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
