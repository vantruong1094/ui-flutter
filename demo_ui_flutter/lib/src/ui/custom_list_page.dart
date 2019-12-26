import 'package:flutter/material.dart';

class CustomListPage extends StatefulWidget {
  @override
  _CustomListPageState createState() => _CustomListPageState();
}

class _CustomListPageState extends State<CustomListPage> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_scrollDidChange);
  }

  _scrollDidChange() {
    final offset = _controller.offset;
    print("offset = $offset");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom List"),
      ),
      body: ListView.builder(
        controller: _controller,
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildHeaderListView();
          } else {
            return _buildItemListView();
          }
        },
      ),
    );
  }

  Widget _buildHeaderListView() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/img_header_custom_list.jpg"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 300, 16, 16),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemListView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: Colors.red,
      ),
    );
  }
}
