
import 'package:flutter/material.dart';

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
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: CurveClipper(),
              child: Container(
                width: size.width,
                height: size.height/4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffff1e39),
                      Color(0xffff4125),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/2, size.height/2, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return null;
  }

}