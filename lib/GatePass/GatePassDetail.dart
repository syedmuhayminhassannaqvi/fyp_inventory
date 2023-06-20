import 'package:flutter/material.dart';
import 'AddGatePass.dart';

class GatePassDetail extends StatelessWidget {
  const GatePassDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF004096).withOpacity(0.9),
        title: Text('Gate Pass Detail'),
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
                  child: Icon(Icons.accessibility_new_outlined, color: Color(0xFF004096)),
                ),
                title: Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('Muhaymin'),
              ),
            ),
            Card(
              elevation: 3,
              child: ListTile(
                leading: CircleAvatar(
                  foregroundColor: Colors.purpleAccent,
                  child: Icon(Icons.calendar_today, color: Color(0xFF004096)),
                ),
                title: Text(
                  'Date',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('2023-02-28'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 3,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      foregroundColor: Colors.purpleAccent,
                      child: Icon(Icons.location_on_sharp, color: Color(0xFF004096)),
                    ),
                    title: Text(
                      'Gate Pass',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Document',
                      style: TextStyle(
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    child: Image.asset('path_to_your_image.png'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddGatePass()),
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Update Data',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF004096).withOpacity(0.9),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
