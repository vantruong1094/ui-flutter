import 'package:demo_ui_flutter/src/listview/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListCategoryPage extends StatefulWidget {
  ListCategoryPage({Key key}) : super(key: key);

  _ListCategoryPageState createState() => _ListCategoryPageState();
}

class _ListCategoryPageState extends State<ListCategoryPage> {
  List<CategoryModel> categories = List();

  @override
  void initState() {
    super.initState();
    _fakeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Category'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250,
                color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 0, 26),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('${categories[index].name}'),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories[index].items.length,
                        itemBuilder: (context, indexItem) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _fakeData() {
    for (int i = 0; i < 5; i++) {
      var cateModel = CategoryModel();
      cateModel.name = "Category 1";
      for (int j = 0; j < 10; j++) {
        cateModel.items.add("Item $i");
      }

      categories.add(cateModel);
    }
  }
}
