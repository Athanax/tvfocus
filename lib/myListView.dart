import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[

          // iterating container starts here
          Focus(
            // autofocus: true,
            child: Builder(
              
              builder: (context) {
                final FocusNode focusNode = Focus.of(context);
                    final bool hasFocus = focusNode.hasFocus;
                return Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: new BoxDecoration(color: hasFocus? Colors.blue: Colors.red),
                  child: new Padding(
                    padding: EdgeInsets.all(8.0),
                    child: new Text('wambua'),
                  ),
                );
              },
            ),
          ),

          // iterationg container ends here

          // iterating container starts here
          Focus(
            // autofocus: true,
            child: Builder(
              
              builder: (context) {
                final FocusNode focusNode = Focus.of(context);
                    final bool hasFocus = focusNode.hasFocus;
                return Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: new BoxDecoration(color: hasFocus? Colors.blue: Colors.red),
                  child: new Padding(
                    padding: EdgeInsets.all(8.0),
                    child: new Text('wambua'),
                  ),
                );
              },
            ),
          ),

          // iterationg container ends here

          // iterating container starts here

          Focus(
            // autofocus: true,
            child: Builder(
              
              builder: (context) {
                final FocusNode focusNode = Focus.of(context);
                    final bool hasFocus = focusNode.hasFocus;
                return Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: new BoxDecoration(color: hasFocus? Colors.blue: Colors.red),
                  child: new Padding(
                    padding: EdgeInsets.all(8.0),
                    child: new Text('wambua'),
                  ),
                );
              },
            ),
          ),

          // iterationg container ends here

          // iterating container starts here

          Focus(
            // autofocus: true,
            child: Builder(
              
              builder: (context) {
                final FocusNode focusNode = Focus.of(context);
                    final bool hasFocus = focusNode.hasFocus;
                return Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: new BoxDecoration(color: hasFocus? Colors.blue: Colors.red),
                  child: new Padding(
                    padding: EdgeInsets.all(8.0),
                    child: new Text('wambua'),
                  ),
                );
              },
            ),
          ),
          // iterationg container ends here

        ],
      ),
    );
  }
}
