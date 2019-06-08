import 'package:flutter/material.dart';

class FadingWidgetScreen extends StatefulWidget {

  _FadingWidgetScreenState createState() => new _FadingWidgetScreenState();
}

class _FadingWidgetScreenState extends State<FadingWidgetScreen> {

  bool _visible = true;

  Widget buildTutorial() {
    return AnimatedOpacity(
      // define the opacity of the widget
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 300),
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.green,
      ),
    );
  }

  void buttonAction() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fade a Widget in and out"), centerTitle: true,),
      body: Center(child: buildTutorial()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.flip),
        onPressed: () {
          this.buttonAction();
        },
      ),
    );
  }
}