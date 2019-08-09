
import 'package:chopper/chopper.dart';
import 'package:demo_ui_flutter/src/service/post_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (_) => PostApiService.create(),
      dispose: (context, PostApiService service) => service.client.dispose(),
      child: BodyListPost(),
    );
  }

}

class BodyListPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Posts'),
        ),
        body: _buildBody(context),
      );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {
    return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context).getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var data = snapshot.data.body;
          print(data);
          return Container(
            color: Colors.redAccent,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
    },);
  }
}