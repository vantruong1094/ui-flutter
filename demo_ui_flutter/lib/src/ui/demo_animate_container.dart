import 'package:flutter/material.dart';

class DemoAnimateContainer extends StatefulWidget {
  @override
  _DemoAnimateContainerState createState() => _DemoAnimateContainerState();
}

class _DemoAnimateContainerState extends State<DemoAnimateContainer> {
  double heightPosition = 0;
  bool isExpaned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate Container'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.orangeAccent,
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: Container(
              height: 40,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    heightPosition = 500;
                  });
                },
                child: Text('Tap me'),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  heightPosition = 0;
                });
              },
              child: AnimatedContainer(
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 500),
                height: heightPosition,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
