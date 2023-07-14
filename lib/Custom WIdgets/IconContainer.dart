import 'package:flutter/material.dart';

class IconContainer extends StatefulWidget {
  IconContainer(
      {Key? key,
      required this.iconname,
      required this.title,
      required this.colorbox})
      : super(key: key);
  String title;
  IconData iconname;
  Color colorbox;

  @override
  State<IconContainer> createState() => _IconContainerState();
}

class _IconContainerState extends State<IconContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
            width: 100,
            height: 110,
            decoration: BoxDecoration(
                color: widget.colorbox.withOpacity(0.2),
                borderRadius: BorderRadius.circular(17)),
            child: Column(
              children: [
                SizedBox(
                  height: 26,
                ),
                Icon(
                  widget.iconname,
                  size: 37,
                  color: Colors.black54.withOpacity(0.8),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
