import 'package:flutter/material.dart';
import 'package:cookbooks_training/cookbooks/07_navigation/03_navigate_with_named_routes/FirstScreen.dart';
import 'package:cookbooks_training/cookbooks/07_navigation/03_navigate_with_named_routes/SecondScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cookbooks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => MyHomePage(title: "Flutter CookBooks"),
        "/07_navigation/03_navigate_with_named_routes/firstScreen": (context) =>
            FirstScreen(),
        "/07_navigation/03_navigate_with_named_routes/secondScreen":
            (context) => SecondScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  Widget buildRowItem(
      {String bookName, String bookRoute, BuildContext context}) {
    return ListTile(
      title: Text(
        bookName,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: () {
        Navigator.pushNamed(context, bookRoute);
      },
    );
  }

  Widget buildRowTitle(String title, BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15.0, 45.0, 15.0, 5.0),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          buildRowTitle("07. Navigation", context),
          buildRowItem(
              bookName: "03. Navigate with named routes",
              bookRoute:
                  "/07_navigation/03_navigate_with_named_routes/firstScreen",
              context: context)
        ],
      ),
    );
  }
}
