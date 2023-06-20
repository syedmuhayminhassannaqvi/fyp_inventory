import 'package:flutter/material.dart';

class IconContainer extends StatefulWidget {
   IconContainer({Key? key,required this.iconname,required this.title,required this.colorbox}) : super(key: key);
  String title;
  IconData iconname;
  Color colorbox;

  @override
  State<IconContainer> createState() => _IconContainerState();
}

class _IconContainerState extends State<IconContainer> {
  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.redAccent.withOpacity(0.9)
                ),
                child: Center(
                  child: Text('1',style: TextStyle(
                    color: Colors.white,
                    fontSize: 8
                  ),),
                ),
              ),
              Container(
                width: 100,
                height: 110,
                decoration: BoxDecoration(
                    color: widget.colorbox.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(17)
                ),
                child: Column(
                  children: [
                    SizedBox(height: 26,),
                    Icon(widget.iconname,size: 37,color: Colors.black54.withOpacity(0.8),),
                    SizedBox(height: 7,),
                    Text(widget.title,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:12
                    ),)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
