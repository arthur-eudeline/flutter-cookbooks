import 'package:flutter/material.dart';
import './main.dart';

class FloatingAppBarListApp extends StatefulWidget {
  _FloatingAppBarListAppState createState() =>
      new _FloatingAppBarListAppState();
}

class _FloatingAppBarListAppState extends State<FloatingAppBarListApp> {
  // Todo screen title
  String _screenTitle = "Floating App Bar";

  void buttonAction() {
    // Todo button action
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(this._screenTitle),
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                    title: Text('Item #$index'),
                  ),
              childCount: 1000,
            ),
          )
        ],
      ),
    );
  }
}
