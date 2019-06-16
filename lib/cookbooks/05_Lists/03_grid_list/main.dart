import 'package:flutter/material.dart';

class GridListApp extends StatefulWidget {

  _GridListAppState createState() => new _GridListAppState();
}

class _GridListAppState extends State<GridListApp> {

  // Todo screen title
  String _screenTitle = "Horizontal list";

  Widget buildTutorial() {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(100, (index) {
        return Center(
          child: Text(
            'Item $index',
            style: Theme.of(context).textTheme.headline,
          ),
        );
      }),
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