import 'package:flutter/material.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({Key? key}) : super(key: key);

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  List<bool> checkBoxValues = List.generate(15, (index) => false);
  bool isUpdating = false;

  void updateRoles() {
    setState(() {
      isUpdating = true;

      // Simulating an asynchronous update process
      Future.delayed(Duration(seconds: 2), () {
        isUpdating = false;
        showUpdateNotification();
      });
    });
  }

  void showUpdateNotification() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Roles updated successfully.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF004096),
        centerTitle: true,
        title: Text("User Detail"),
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'User Roles',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 100,),
              Text(
                'Read',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 80,),
              Text(
                'Write',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: Color(0xFF004096),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: checkBoxValues.length ~/ 2,
                itemBuilder: (BuildContext context, int index) {
                  int startingIndex = index * 2;

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Role' + index.toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(width: 120),
                          Checkbox(
                            value: checkBoxValues[startingIndex],
                            onChanged: isUpdating
                                ? (value) {
                              setState(() {
                                checkBoxValues[startingIndex] = value!;
                              });
                            }
                                : null,
                          ),
                          SizedBox(width: 80),
                          Checkbox(
                            value: checkBoxValues[startingIndex + 1],
                            onChanged: isUpdating
                                ? (value) {
                              setState(() {
                                checkBoxValues[startingIndex + 1] = value!;
                              });
                            }
                                : null,
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 2,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: isUpdating ? null : updateRoles,
              child: Text('Update'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF004096),
              ),
            ),
          ),
          SizedBox(height: 100,)
        ],
      ),
    );
  }
}
