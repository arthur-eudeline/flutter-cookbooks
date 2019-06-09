import 'package:cookbooks_training/cookbooks/03_forms/01_form_validation/my_custom_form.dart';
import 'package:flutter/material.dart';

class AppFormValidation extends StatefulWidget {

  _AppFormValidationState createState() => new _AppFormValidationState();
}

class _AppFormValidationState extends State<AppFormValidation> {

  // Todo screen title
  String _screenTitle = "Form validation";

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