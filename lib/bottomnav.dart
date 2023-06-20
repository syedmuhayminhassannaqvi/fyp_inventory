import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'AddData.dart';
import 'dasboardview.dart';
import 'datadetail.dart';
import 'login.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  // Define the dropdown menu items
  final List<String> _dropdownItems = [
    'SKU 1',
    'SKU 2',
    'SKU 3',

  ];

  // Define the currently selected dropdown item
  late String _selectedDropdownItem;

  @override
  void initState() {
    super.initState();

    // Set the default selected dropdown item
    _selectedDropdownItem = _dropdownItems.first;
  }

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
    ),
    Text(
      'Search',
    ),
    Text(
      'Profile',
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final tabs = [
    InventoryListPage(),
    InventoryListPage(),
    AddData(),
  ];
  int _currentIndex = 0;

  List<Widget> _screens = [
    InventoryListPage(),
    InventoryListPage(),
    AddData(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: GNav(
          gap: 8,
          tabBackgroundColor: Colors.grey.withOpacity(0.1),
          backgroundColor: Color(0xFF004096),
          color: Colors.white,
          activeColor: Colors.white,
          selectedIndex: _currentIndex,
          onTabChange: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              onPressed: () {
                _changeScreen(0);
              },
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
              onPressed: () {
                _changeScreen(1);
              },
            ),
            GButton(
              icon: Icons.add,
              text: 'Add',
              onPressed: () {
                _changeScreen(2);
              },
            ),
          ],
        ),
      ),
      body: _screens[_currentIndex],
    );
  }
  void _changeScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}

