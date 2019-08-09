import 'dart:io';

import 'package:demo_ui_flutter/src/model/item_builder_model.dart';
import 'package:flutter/material.dart';

class ListOnePage extends StatefulWidget {
  @override
  _ListOnePageState createState() => _ListOnePageState();
}

class _ListOnePageState extends State<ListOnePage> {
  final europeanCountries = [
    'Albania',
    'Andorra',
    'Armenia',
    'Austria',
    'Azerbaijan',
    'Belarus',
    'Belgium',
    'Bosnia and Herzegovina',
    'Bulgaria',
    'Croatia',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Estonia',
    'Finland',
    'France',
    'Georgia',
    'Germany',
    'Greece',
    'Hungary',
    'Iceland',
    'Ireland',
    'Italy',
    'Kazakhstan',
    'Kosovo',
    'Latvia',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Macedonia',
    'Malta',
    'Moldova',
    'Monaco',
    'Montenegro',
    'Netherlands',
    'Norway',
    'Poland',
    'Portugal',
    'Romania',
    'Russia',
    'San Marino',
    'Serbia',
    'Slovakia',
    'Slovenia',
    'Spain',
    'Sweden',
    'Switzerland',
    'Turkey',
    'Ukraine',
    'United Kingdom',
    'Vatican City'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List One'),
      ),
      body: _buildListViewBuilder(context),
    );
  }

  Widget _buildListViewSeparated(BuildContext context) {
    return ListView.separated(
      itemCount: europeanCountries.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => print('${europeanCountries[index]}'),
          child: ListTile(
            title: Text('${europeanCountries[index]}'),
          ),
        );
      },
    );
  }

  Widget _buildListViewBuilder(BuildContext context) {
    final items = [
      ItemBuilderModel(Icon(Icons.today), 'Title 1', 'sub title 1'),
      ItemBuilderModel(Icon(Icons.ac_unit), 'AC Unit', 'sub title 2'),
      ItemBuilderModel(Icon(Icons.accessible), 'Accessible', 'sub title 3'),
      ItemBuilderModel(Icon(Icons.beach_access), 'Beach Access', 'sub title 4'),
      ItemBuilderModel(Icon(Icons.cake), 'Cake', 'sub title 5'),
      ItemBuilderModel(Icon(Icons.dashboard), 'Dashboard', 'sub title 6'),
      ItemBuilderModel(Icon(Icons.email), 'Email', 'sub title 7')
    ];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {

          },
          child: _buildItemListBuilder(items[index], index),
        );
      },
    );
  }

  Widget _buildItemListBuilder(ItemBuilderModel item, int index) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, index == 0 ? 8 : 0, 8, 8),
      child: Container(
        height: 50,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 50,
              child: item.icon,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text('${item.title}'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCustomListview(BuildContext context) {
    return ListView.custom();
  }
}
