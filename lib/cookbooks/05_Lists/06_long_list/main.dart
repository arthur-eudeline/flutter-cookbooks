import 'package:flutter/material.dart';
import './main.dart';

class LongListApp extends StatefulWidget {
  _LongListAppState createState() => new _LongListAppState();
}

class _LongListAppState extends State<LongListApp> {
  // Todo screen title
  String _screenTitle = "Working with long List";

  final items = List<String>.generate(100, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this._screenTitle),
          centerTitle: true,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${items[index]}'),
              );
            },
          ),
        ),
    );
  }
}
