// Flutter code sample for material.BottomNavigationBar.1

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:demo_ui_flutter/src/business_page_item.dart';
import 'package:flutter/material.dart';
import 'package:demo_ui_flutter/src/home_page_item.dart';
import 'package:demo_ui_flutter/src/school_page_item.dart';

class HomePageApp extends StatefulWidget {
  HomePageApp({Key key}) : super(key: key);

  @override
  _HomePageAppState createState() => _HomePageAppState();
}

class _HomePageAppState extends State<HomePageApp> {
  int _selectedIndex = 0;
  var listPageItem = new List<Widget>();
  var listTitleAppBar = ["Home", "Business", "School"];

  @override
  void initState() {
    super.initState();

    listPageItem.add(HomePageItem());
    listPageItem.add(BusinessPageItem());
    listPageItem.add(SchoolPageItem());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${listTitleAppBar[_selectedIndex]}'),
      ),
      body: Center(
        child: listPageItem[_selectedIndex],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() => BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      );


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
