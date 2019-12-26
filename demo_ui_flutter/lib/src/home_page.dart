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
import 'package:demo_ui_flutter/src/listview/list_category_page.dart';
import 'package:demo_ui_flutter/src/listview/list_image_page.dart';
import 'package:demo_ui_flutter/src/listview/list_post_screen.dart';
import 'package:demo_ui_flutter/src/listview/ui_list_one.dart';
import 'package:demo_ui_flutter/src/smart_home_page.dart';
import 'package:demo_ui_flutter/src/ui/custom_clipper.dart';
import 'package:demo_ui_flutter/src/ui/custom_list_page.dart';
import 'package:demo_ui_flutter/src/ui/demo_animate_container.dart';
import 'package:flutter/material.dart';
import 'package:demo_ui_flutter/src/home_page_item.dart';
import 'package:demo_ui_flutter/src/school_page_item.dart';

class HomePageApp extends StatefulWidget {
  HomePageApp({Key key}) : super(key: key);

  @override
  _HomePageAppState createState() => _HomePageAppState();
}

class _HomePageAppState extends State<HomePageApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  var listPageItem = new List<Widget>();
  var listTitleAppBar = ["Home", "Business", "Camera", "School", "Apps"];

  @override
  void initState() {
    super.initState();

    listPageItem.add(HomePageItem());
    listPageItem.add(BusinessPageItem());
    listPageItem.add(BusinessPageItem());
    listPageItem.add(SchoolPageItem());
    listPageItem.add(SchoolPageItem());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          title: Text('${listTitleAppBar[_selectedIndex]}'),
          leading: IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white,
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          actions: _buildActionAppBar()),
      drawer: _buildDrawerNavigation(),
      body: Container(
        child: listPageItem[_selectedIndex],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  List<Widget> _buildActionAppBar() => <Widget>[
        Container(
            alignment: Alignment.center,
            width: 50,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"))),
                ),
                Positioned(
                  bottom: 0,
                  right: 2,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff00ff1d),
                    ),
                  ),
                )
              ],
            )),
        SizedBox(
          width: 10,
        )
      ];

  Widget _buildBottomNavigationBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
              icon: Icon(
                Icons.camera,
                size: 60,
              ),
              title: Text('', style: TextStyle(height: 0))),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            title: Text('Apps'),
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      );

  Widget _buildDrawerNavigation() => Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Smart Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SmartHomePage()));
              },
            ),
            Divider(
              height: 1,
            ),
            ListTile(
              title: Text('List View'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListOnePage()));
              },
            ),
            Divider(
              height: 1,
            ),
            ListTile(
              title: Text('List Post'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListPostPage()));
              },
            ),
            Divider(
              height: 1,
            ),
            ListTile(
              title: Text('List Image'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListImagePage()));
              },
            ),
            Divider(
              height: 1,
            ),
            ListTile(
              title: Text('Custom List'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomListPage()));
              },
            ),
            Divider(
              height: 1,
            ),
            ListTile(
              title: Text('List Category'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListCategoryPage()));
              },
            ),
            Divider(
              height: 1,
            ),
            ListTile(
              title: Text('Custom Clipper'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyClipperPage()));
              },
            ),
            Divider(
              height: 1,
            ),
            ListTile(
              title: Text('Animate container'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DemoAnimateContainer()));
              },
            )
          ],
        ),
      );
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
