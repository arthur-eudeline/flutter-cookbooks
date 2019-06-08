import 'package:flutter/material.dart';

class AppDrawerScreen extends StatefulWidget {
  _AppDrawerScreenState createState() => new _AppDrawerScreenState();
}

class _AppDrawerScreenState extends State<AppDrawerScreen> {
  // Todo screen title
  String _screenTitle = "Add a drawer to a screen";

  // Todo Button Icon
  IconData _buttonIcon = Icons.menu;

  Widget buildTutorial(BuildContext context) {
    // Todo Widgets of the tutorial
    return Center(
      child: OutlineButton(
        child: Text('Back to Home'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void buttonAction(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_screenTitle),
        centerTitle: true,
      ),
      body: Center(child: buildTutorial( context )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: Icon(this._buttonIcon),
        onPressed: () {
          _scaffoldKey.currentState.openDrawer();
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text("Drawer Header"),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Close the Drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Close the Drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
