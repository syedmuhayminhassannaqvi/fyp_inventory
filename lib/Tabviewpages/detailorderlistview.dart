import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomeDetail.dart';
import 'HomeDetail2.dart';
import 'HomeDetail3.dart';

class DetailOrderListView extends StatefulWidget {
  DetailOrderListView(this.index, {Key? key}) : super(key: key);

  int index;

  @override
  State<DetailOrderListView> createState() => _DetailOrderListViewState();
}

class _DetailOrderListViewState extends State<DetailOrderListView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
              Tab(icon: Icon(Icons.delete_forever_outlined)),
            ],
          ),
          title: Text('Puschase Orders'),
        ),
        body: TabBarView(
          children: [
            HomeOrderDetail(),
            HomeOrderDetail2(),
            HomeOrderDetail3(),
          ],
        ),
      ),
    );
  }
}
