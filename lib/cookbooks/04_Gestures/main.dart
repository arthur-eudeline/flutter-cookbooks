import 'package:flutter/material.dart';

class AppGesture extends StatefulWidget {
  _AppGestureState createState() => new _AppGestureState();
}

class _AppGestureState extends State<AppGesture> {
  // Todo screen title
  String _screenTitle = "Swipe to dismiss";

  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  Widget buildTutorial() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          // Background on left
          background: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.delete,
                  color: Colors.white,
                )
              ],
            ),
          ),

          // Background on right
          secondaryBackground: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(
                  Icons.check,
                  color: Colors.white,
                )
              ],
            ),
          ),

          key: Key(items[index]),
          onDismissed: (direction) {
            setState(() {
              items.removeAt(index);
            });

            Scaffold.of(context).showSnackBar(SnackBar(
              content: (direction == DismissDirection.startToEnd)
                ? Text("${items[index]} dismissed")
                : Text("${items[index]} saved"),
              behavior: SnackBarBehavior.floating,
            ));
          },
          child: ListTile(title: Text('${items[index]}')),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screenTitle),
        centerTitle: true,
      ),
      body: Center(child: buildTutorial()),
    );
  }
}
