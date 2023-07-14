import 'package:flutter/material.dart';

class CustomDrawerTile extends StatefulWidget {
  CustomDrawerTile({Key? key, required this.title, this.icon})
      : super(key: key);
  String title;
  IconData? icon;

  @override
  State<CustomDrawerTile> createState() => _CustomDrawerTileState();
}

class _CustomDrawerTileState extends State<CustomDrawerTile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
        elevation: 4,
        child: ListTile(
          title: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          trailing: Icon(widget.icon),
        ),
      ),
    );
  }
}
