import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListImagePage extends StatefulWidget {
  ListImagePage({Key key}) : super(key: key);

  _ListImagePageState createState() => _ListImagePageState();
}

class _ListImagePageState extends State<ListImagePage> {
  List listItem = new List();

  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < 5; i++) {
      getListImage().then((response) {}).catchError((error) {
        print('has eror $error');
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Image'),
      ),
      body: _buildListImage(context),
    );
  }

  Widget _buildListImage(BuildContext context) {
    return ListView.builder(
      itemCount: listItem.length,
      itemBuilder: (context, index) {
        return _buildItemListImage(index);
      },
    );
  }

  Widget _buildItemListImage(int index) {
    return Card(
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: listItem[index]["urls"]["small"],
            placeholder: (context, url) => new CircularProgressIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          ),
          Text(
            'Item 1',
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }

  Future<String> getListImage() async {
    var response = await http.get('https://unsplash.com/napi/photos');
    print("${response.body}");
    var jsons = jsonDecode(response.body) as List;
    setState(() {
      jsons.forEach((json) => listItem.add(json));
    });

    return "Success";
  }
}
