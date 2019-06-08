import 'package:flutter/material.dart';

class AppSnackBar extends StatefulWidget {
  _AppSnackBarState createState() => new _AppSnackBarState();
}

class _AppSnackBarState extends State<AppSnackBar> {
  // Todo screen title
  String _screenTitle = "Displaying Snackbars";

  // Todo Button Icon
  IconData _buttonIcon = Icons.notifications;

  Widget buildTutorial() {
    // Todo Widgets of the tutorial
    return null;
  }

  void buttonAction() {
    _key.currentState.showSnackBar(SnackBar(
      duration: Duration(seconds: 10),
      behavior: SnackBarBehavior.floating,
      content: Text('A super SnackBar !'),
      action: SnackBarAction(
        label: "Dismiss",
        onPressed: () {
          _key.currentState.hideCurrentSnackBar();
        },
      ),
    ));
  }

  GlobalKey<ScaffoldState> _key = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(_screenTitle),
        centerTitle: true,
      ),
      body: Center(child: buildTutorial()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: Icon(this._buttonIcon),
        onPressed: () {
          this.buttonAction();
        },
      ),
    );
  }
}
