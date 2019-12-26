
import 'package:flutter/material.dart';

class BusinessPageItem extends StatelessWidget {
  const BusinessPageItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Stack(
        children: <Widget>[
          Container(
            height: 300,
            color: Colors.green,
          ),
          Positioned(
            top: 150,
            height: 400,
            width: 300,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
          )
        ],
      ),
    );
  }
}