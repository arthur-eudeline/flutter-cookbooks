import 'package:flutter/material.dart';

class AppFont extends StatefulWidget {
  _AppFontState createState() => new _AppFontState();
}

class _AppFontState extends State<AppFont> {
  // Todo screen title
  String _screenTitle = "Custom Fonts";

  // Todo Button Icon
  IconData _buttonIcon;

  Widget buildTutorial() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: ThemeData(
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.indigoAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              color: Colors.indigoAccent,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1,
                  color: Colors.indigoAccent,
                  blurRadius: 15,
                )
              ],
            ),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.all(Radius.circular(5)),

              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'Hire me',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
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
