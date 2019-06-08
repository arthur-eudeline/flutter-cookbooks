import 'package:flutter/material.dart';

class AppOrientationUI extends StatefulWidget {

  _AppOrientationUIState createState() => new _AppOrientationUIState();
}

class _AppOrientationUIState extends State<AppOrientationUI> {

  // Todo screen title
  String _screenTitle = "Updating the UI with screen Orientation";

  // Todo Button Icon
  IconData _buttonIcon;

  Widget buildTutorial() {
    return OrientationBuilder(
      builder: (context, orientation) {
        return GridView.count(
          // Create a grid with 2 columns in portrait mode, or 3 columns in
          // landscape mode.
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline,
              ),
            );
          }),
        );
      },
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