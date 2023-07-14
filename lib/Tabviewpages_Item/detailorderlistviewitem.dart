import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomeDetailItem.dart';
import 'HomeDetailItem2.dart';

class DetailOrderListViewItem extends StatefulWidget {
  DetailOrderListViewItem(this.index, {Key? key}) : super(key: key);

  int index;

  @override
  State<DetailOrderListViewItem> createState() =>
      _DetailOrderListViewItemState();
}

class _DetailOrderListViewItemState extends State<DetailOrderListViewItem> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: widget.index,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF004096)
              .withOpacity(0.9), // Set the app bar background color
          bottom: TabBar(
            indicatorColor:
                Colors.white, // Set the indicator color for the selected tab
            tabs: [
              Tab(icon: Icon(Icons.pending_actions_rounded)),
              Tab(icon: Icon(Icons.done)),
            ],
          ),
          title: Text('Current Puschase Orders Items'),
        ),
        body: TabBarView(
          children: [
            HomeOrderDetailItem(),
            HomeOrderDetailItem2(),
          ],
        ),
      ),
    );
  }
}
