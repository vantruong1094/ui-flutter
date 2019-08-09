import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SmartHomePage extends StatefulWidget {
  @override
  _SmartHomePageState createState() => _SmartHomePageState();
}

class _SmartHomePageState extends State<SmartHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      height: size.height,
      width: size.width,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              width: size.width,
              height: size.height / 4,
              color: Colors.red,
            ),
          ),
          Positioned(
            top: 40,
            width: size.width,
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Smart Home',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
          Positioned(
            top: size.height * 0.08,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 32, 18, 18),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffeff2f3),
                          offset: Offset(1, 5),
                          blurRadius: 3.0)
                    ]),
                child: Column(
                  children: <Widget>[
                    _buildDashBoardRow1(),
                    Divider(
                      color: Colors.grey[300],
                      height: 0.5,
                    ),
                    _buildDashboardRow2()
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.08 + 232,
            height: size.height - (size.height * 0.08 + 232),
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 0, 10),
                  child: Text('List 1', style: TextStyle(fontSize: 16)),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(left: 16),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(3, (_) {
                      return _buildListOneItem(size);
                    })
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 0, 10),
                  child: Text('List 2', style: TextStyle(fontSize: 16)),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(left: 16),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(3, (_) {
                      return _buildListOneItem(size);
                    })
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget _buildListOneItem(Size size) {
    return Card(
      child: Container(
        width: size.width * 0.6,
        color: Colors.blue,
      ),
    );
  }

  Widget _buildDashBoardRow1() {
    return Expanded(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 70,
                      decoration: BoxDecoration(color: Colors.redAccent),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Title 1'),
                        SizedBox(height: 4),
                        Text('Sub Title 1')
                      ],
                    )
                  ],
                ),
              ),
            ),
            VerticalDivider(
              color: Colors.grey[300],
              width: 1,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 70,
                      decoration: BoxDecoration(color: Colors.redAccent),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Title 1'),
                        SizedBox(height: 4),
                        Text('Sub Title 1')
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }

  Widget _buildDashboardRow2() {
    return Expanded(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 70,
                      decoration: BoxDecoration(color: Colors.redAccent),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Title 1'),
                        SizedBox(height: 4),
                        Text('Sub Title 1')
                      ],
                    )
                  ],
                ),
              ),
            ),
            VerticalDivider(
              color: Colors.grey[300],
              width: 1,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 70,
                      decoration: BoxDecoration(color: Colors.redAccent),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Title 1'),
                        SizedBox(height: 4),
                        Text('Sub Title 1')
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
