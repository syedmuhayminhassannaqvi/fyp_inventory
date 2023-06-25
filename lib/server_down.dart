import 'package:flutter/material.dart';

class ServerDown extends StatelessWidget {
  const ServerDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning_amber,
              size: 100,
            ),
            Text(
              "Server is Down",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
