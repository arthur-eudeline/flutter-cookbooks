import 'package:flutter/material.dart';

class BasicListApp extends StatefulWidget {

  _BasicListAppState createState() => new _BasicListAppState();
}

class _BasicListAppState extends State<BasicListApp> {

  // Todo screen title
  String _screenTitle = "Basic list";

  Widget buildTutorial() {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Map'),
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Album'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Phone'),
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