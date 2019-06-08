import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('First Screen'),
    ),
    body: Center(
      child: RaisedButton(
        child: Text('Launch screen'),
        onPressed: () {
          // Go to the widget defined for the route "/second" in ./routes.dart
          Navigator.pushNamed(context, '/second');
        },
      ),
    ),
  );
}
}