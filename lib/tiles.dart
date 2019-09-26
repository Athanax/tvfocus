import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTiles extends StatefulWidget {
  MyTiles({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyTiles> {
  Color _color = Colors.white;
  // Color _color2 = Colors.white;

  String focussed = 'none';

  bool _handleKeyPress(FocusNode node, RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      print('Focus node ${node.debugLabel} got key event: ${event.logicalKey}');
      if (event.logicalKey == LogicalKeyboardKey.keyR) {
        print('Changing color to red.');
        setState(() {
          _color = Colors.red;
        });
        return true;
      } else if (event.logicalKey == LogicalKeyboardKey.keyG) {
        print('Changing color to green.');
        setState(() {
          _color = Colors.green;
        });
        return true;
      } else if (event.logicalKey == LogicalKeyboardKey.keyB) {
        print('Changing color to blue.');
        setState(() {
          _color = Colors.blue;
          // _color2 = Colors.blueGrey;
        });
        return true;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        node.nextFocus();
        print('down arrow key pressed');
        return true;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        node.previousFocus();
      } else if (event is RawKeyDownEvent) {
        if (event.logicalKey == LogicalKeyboardKey.enter) {
          print('Enter key pressed');

          return true;
        }
        return true;
      }
    }
    return false;
  }

  bool listOnePressed(FocusNode node, RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.digit1) {
        print('Enter key pressed');
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('tiles here'),
      ),
      body: FocusScope(
        onKey: _handleKeyPress,
        debugLabel: 'Scope',
        autofocus: false,
        child: DefaultTextStyle(
          style: textTheme.display1,
          child: Column(
            children: <Widget>[
              Focus(
                onKey: listOnePressed,
                debugLabel: 'tile one',
                autofocus: true,
                // onFocusChange: ,
                child: Builder(
                  builder: (BuildContext context) {
                    final FocusNode focusNode = Focus.of(context);
                    final bool hasFocus = focusNode.hasFocus;
                    
                    return Center(
                      child: Container(
                        width: 400,
                        height: 100,
                        alignment: Alignment.center,
                        color: hasFocus ? _color : Colors.white,
                        child: Text(hasFocus
                            ? "I'm in color! Press R,G,B!"
                            : 'Press to focus'),
                      ),
                    );
                  },
                ),
              ),
              new ListTile(
                title: new Text(focussed),
              ),
              new Row(
                children: <Widget>[
                  new RaisedButton(
                    color: Colors.redAccent,
                    onPressed: () {},
                    child: new Text('button one'),
                  ),
                  Focus(
                    onKey: listOnePressed,
                    debugLabel: 'Button',
                    child: Builder(
                      builder: (BuildContext context) {
                        final FocusNode focusNode = Focus.of(context);
                        final bool hasFocus = focusNode.hasFocus;
                        return Center(
                          child: Container(
                            alignment: Alignment.center,
                            color: hasFocus ? Colors.amber : Colors.white,
                            child: Text(hasFocus ? 'Focused' : 'not focussed'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              // Focus(child: new ListView(),),
              Focus(
                onKey: _handleKeyPress,
                debugLabel: 'Button',
                child: Builder(
                  builder: (BuildContext context) {
                    final FocusNode focusNode = Focus.of(context);
                    final bool hasFocus = focusNode.hasFocus;
                    return Center(
                      child: Container(
                        width: 400,
                        height: 100,
                        alignment: Alignment.center,
                        color: hasFocus ? Colors.amber : Colors.white,
                        child: Text(hasFocus
                            ? "I'm in color! Press R,G,B!"
                            : 'Press to focus'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
