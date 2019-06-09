import 'package:cookbooks_training/cookbooks/03_forms/my_custom_form.dart';
import 'package:flutter/material.dart';

class AppForm extends StatefulWidget {

  _AppFormState createState() => new _AppFormState();
}

class _AppFormState extends State<AppForm> {

  // Todo screen title
  String _screenTitle = "Forms";

  Widget buildTutorial() {
    return MyCustomForm();
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