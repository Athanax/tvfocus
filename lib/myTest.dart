import 'package:flutter/material.dart';
import 'package:tv_focus/myListView.dart';

class TestColumnList extends StatefulWidget {
  @override
  _TestColumnListState createState() => _TestColumnListState();
}

class _TestColumnListState extends State<TestColumnList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: new Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.all(8.0),
                      child: new Text('red'),
                    ),
                    new ListTile(
                      title: new Text('data'),
                    ),
                    MyListView()
                  ],
                ))));
      }),
    );
  }
}
