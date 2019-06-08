import 'package:flutter/material.dart';

class __WIDGET__NAME__ extends StatefulWidget {

  __STATE_CLASS_NAME__ createState() => new __STATE_CLASS_NAME__();
}

class __STATE_CLASS_NAME__ extends State<__WIDGET__NAME__> {

  // Todo screen title
  String _screenTitle = "";

  // Todo Button Icon
  IconData _buttonIcon;

  Widget buildTutorial() {
    // Todo Widgets of the tutorial
    return null;
  }

  void buttonAction() {
    // Todo button action
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_screenTitle), centerTitle: true,),
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