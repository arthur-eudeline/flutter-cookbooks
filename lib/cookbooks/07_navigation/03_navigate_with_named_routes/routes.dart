import 'package:cookbooks_training/cookbooks/07_navigation/03_navigate_with_named_routes/FirstScreen.dart';
import 'package:cookbooks_training/cookbooks/07_navigation/03_navigate_with_named_routes/SecondScreen.dart';
import 'package:flutter/material.dart';

routes(BuildContext context) {
  return {
    // When we navigate to the "/" route, build the FirstScreen Widget
    '/': (context) => FirstScreen(),
    // When we navigate to the "/second" route, build the SecondScreen Widget
    '/second': (context) => SecondScreen(),
  };
}