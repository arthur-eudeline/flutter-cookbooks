import 'package:flutter/material.dart';

// Animations
import 'package:cookbooks_training/cookbooks/01_animation/01_animate_the_properties_of_a_container/main.dart';
import 'package:cookbooks_training/cookbooks/01_animation/02_fade_a_widget_in_and_out/main.dart';

// Design
import 'package:cookbooks_training/cookbooks/02_design/01_add_a_drawer_to_a_screen/main.dart';
import 'package:cookbooks_training/cookbooks/02_design/02_displaying_snackbars/main.dart';


// Navigation
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

        // Animations
        "/01_animation/01_animate_the_properties_of_a_container/main" : (context) => AnimatedContainerApp(),
        "/01_animation/02_fade_a_widget_in_and_out/main" : (context) => FadingWidgetScreen(),

        // Design
        "/02_design/01_add_a_drawer_to_a_screen/main" : (context) => AppDrawerScreen(),
        "/02_design/02_displaying_snackbars/main" : (context) => AppSnackBar(),

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
      padding: EdgeInsets.fromLTRB(15.0, 60.0, 15.0, 15.0),
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
          // ---- 01 Animation ----
          buildRowTitle("01. Animation", context),
          buildRowItem(
            bookName: "01 Animate the properties of a Container",
            bookRoute: "/01_animation/01_animate_the_properties_of_a_container/main",
            context: context
          ),
          buildRowItem(
            bookName: "02 Fade a Widget in and out",
            bookRoute: "/01_animation/02_fade_a_widget_in_and_out/main",
            context: context
          ),
          // ---- 02 Design ----
          buildRowTitle("02. Design", context),
          buildRowItem(
            bookName: "01 Add a Drawer to a screen",
            bookRoute: "/02_design/01_add_a_drawer_to_a_screen/main",
            context: context
          ),
          buildRowItem(
            bookName: "02 Displaying SnackBars",
            bookRoute: "/02_design/02_displaying_snackbars/main",
            context: context
          ),

          // ---- 07 Navigation ----
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
