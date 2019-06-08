import 'package:flutter/material.dart';

class AppTheme extends StatefulWidget {
  _AppThemeState createState() => new _AppThemeState();
}

class _AppThemeState extends State<AppTheme> {
  // Todo screen title
  String _screenTitle = "App Theme";

  Widget buildTutorial() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Theme(
                    data: ThemeData(
                      primarySwatch: Colors.red,
                      buttonTheme: ButtonThemeData(
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        textTheme: ButtonTextTheme.primary,
                        buttonColor: Colors.red,
                        shape : BeveledRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0))),
                        disabledColor: Colors.purple
                      )
                    ),
                    child: OutlineButton(onPressed: () {}, child: Text('My button')),
                  ),
                  Text('With Theme')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  OutlineButton(onPressed: () {}, child: Text('My button')),
                  Text('Without Theme')
                ],
              ),
            )
          ],
        ),
        Theme(
          data : ThemeData(
            textTheme: TextTheme(
              title: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.deepOrangeAccent
              )
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: MyAwesomeThemedText(),
          ),
        )
      ],
    );
  }

  void buttonAction() {
    // Todo button action
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screenTitle),
        centerTitle: true,
      ),
      body: Center(child: buildTutorial()),
    );
  }
}

class MyAwesomeThemedText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("My awesome text", style: Theme.of(context).textTheme.title,);
  }
}