// Flutter code sample for

// This example shows how to manage focus using the [Focus] and [FocusScope]
// widgets. See [FocusNode] for a similar example that doesn't use [Focus] or
// [FocusScope].

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyFocusClass extends StatefulWidget {
  MyFocusClass({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyFocusClass> {
  Color _color = Colors.white;

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
        });
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return FocusScope(
      debugLabel: 'Scope',
      autofocus: true,
      child: DefaultTextStyle(
        style: textTheme.display1,
        child: Focus(
          onKey: _handleKeyPress,
          debugLabel: 'Button',
          child: Builder(
            builder: (BuildContext context) {
              final FocusNode focusNode = Focus.of(context);
              final bool hasFocus = focusNode.hasFocus;
              return GestureDetector(
                onTap: () {
                  if (hasFocus) {
                    focusNode.unfocus();
                  } else {
                    focusNode.requestFocus();
                  }
                },
                child: Center(
                  child: Container(
                    width: 400,
                    height: 100,
                    alignment: Alignment.center,
                    color: hasFocus ? _color : Colors.white,
                    child: Text(hasFocus
                        ? "I'm in color! Press R,G,B!"
                        : 'Press to focus'),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}