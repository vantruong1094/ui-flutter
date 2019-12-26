import 'dart:async';

import 'package:demo_ui_flutter/src/ui/custom_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyClipperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Clipper'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 100,
                  color: Colors.redAccent,
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: RaisedButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return FunkyOverlay();
                    },
                    //child: FunkyOverlay(),
                  );
                },
                child: Text('Show Alert'),
              ),
            ),
            Material(
              elevation: 10,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: IndexStackPage(),
            ),
          ],
        ),
      ),
    );
  }
}

class IndexStackPage extends StatefulWidget {
  @override
  _IndexStackPageState createState() => _IndexStackPageState();
}

class _IndexStackPageState extends State<IndexStackPage> {
  final _bloc = IndexStackBloc();

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: _bloc.indexStackStream,
        builder: (context, snapshot) {
          return Stack(
            children: <Widget>[
              IndexedStack(
                index: snapshot.data == null ? 0 : snapshot.data,
                children: <Widget>[
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.orange,
                  ),
                  Container(
                    color: Colors.yellow,
                  ),
                ],
              ),
              Positioned(
                left: 10,
                bottom: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                      heroTag: "tag1",
                      onPressed: () {
                        _bloc.onSelectedIndex(0);
                        _bloc.setEnableButton(false);
                      },
                      child: Icon(
                        Icons.textsms,
                        color: Colors.white,
                      ),
                    ),
                    StreamBuilder<bool>(
                      stream: _bloc.enableButtonStream,
                      builder: (context, snapshot) {
                        return Visibility(
                          visible: snapshot.data == null ? true : snapshot.data,
                          child: FloatingActionButton(
                            heroTag: "tag2",
                            onPressed: () {
                              _bloc.onSelectedIndex(1);
                            },
                            child: Icon(
                              Icons.headset,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                    ),
                    FloatingActionButton(
                      heroTag: "tag3",
                      onPressed: () {
                        _bloc.onSelectedIndex(2);
                        _bloc.setEnableButton(true);
                      },
                      child: Icon(
                        Icons.ac_unit,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }
}

class IndexStackBloc {
  StreamController<int> _indexStackController = new StreamController<int>();
  StreamController<bool> _enableButtonController = StreamController<bool>();

  Stream<int> get indexStackStream => _indexStackController.stream;
  Sink<int> get indexStackSink => _indexStackController.sink;

  Stream<bool> get enableButtonStream => _enableButtonController.stream;

  onSelectedIndex(int index) {
    indexStackSink.add(index);
  }

  setEnableButton(bool enable) {
    _enableButtonController.sink.add(enable);
  }

  dispose() {
    _indexStackController.close();
    _enableButtonController.close();
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);

    var pointOneOffset = Offset(size.width / 2, size.height - 35);
    var clipperOneOffset = Offset(size.width / 4, (size.height - 50));
    path.quadraticBezierTo(clipperOneOffset.dx, clipperOneOffset.dy,
        pointOneOffset.dx, pointOneOffset.dy);

    var pointTwoOffset = Offset(size.width, size.height - 80);
    var clipperTwoOffset = Offset(size.width * .75, size.height - 10);
    path.quadraticBezierTo(clipperTwoOffset.dx, clipperTwoOffset.dy,
        pointTwoOffset.dx, pointTwoOffset.dy);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
