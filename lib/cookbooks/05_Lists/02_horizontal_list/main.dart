import 'package:flutter/material.dart';

class HorizontalListApp extends StatefulWidget {

  _HorizontalListAppState createState() => new _HorizontalListAppState();
}

class _HorizontalListAppState extends State<HorizontalListApp> {

  // Todo screen title
  String _screenTitle = "Horizontal list";

  Widget buildTutorial() {
    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 160.0,
          color: Colors.red,
        ),
        Container(
          width: 160.0,
          color: Colors.blue,
        ),
        Container(
          width: 160.0,
          color: Colors.green,
        ),
        Container(
          width: 160.0,
          color: Colors.yellow,
        ),
        Container(
          width: 160.0,
          color: Colors.orange,
        ),
      ],
    );
  }

  void buttonAction() {
    // Todo button action
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_screenTitle), centerTitle: true,),
      body: Center(child: buildTutorial()),
    );
  }
}