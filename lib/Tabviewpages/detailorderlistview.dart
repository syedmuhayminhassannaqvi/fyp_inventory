import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomeDetail.dart';
import 'HomeDetail2.dart';
import 'HomeDetail3.dart';

class DetailOrderListView extends StatefulWidget {
  const DetailOrderListView({Key? key}) : super(key: key);

  @override
  State<DetailOrderListView> createState() => _DetailOrderListViewState();
}

class _DetailOrderListViewState extends State<DetailOrderListView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF004096).withOpacity(0.9), // Set the app bar background color
          bottom: TabBar(
            indicatorColor: Colors.white, // Set the indicator color for the selected tab
            tabs: [
              Tab(icon: Icon(Icons.home_filled)),
              Tab(icon: Icon(Icons.lock_clock)),
              Tab(icon: Icon(Icons.people_alt)),
            ],
          ),
          title: Text('Tabs Demo'),
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
