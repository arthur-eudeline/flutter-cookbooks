import 'dart:async';

import 'package:flutter/material.dart';

// Animations
import 'package:cookbooks_training/cookbooks/01_animation/01_animate_the_properties_of_a_container/main.dart';
import 'package:cookbooks_training/cookbooks/01_animation/02_fade_a_widget_in_and_out/main.dart';

// Design
import 'package:cookbooks_training/cookbooks/02_design/01_add_a_drawer_to_a_screen/main.dart';
import 'package:cookbooks_training/cookbooks/02_design/02_displaying_snackbars/main.dart';
import 'package:cookbooks_training/cookbooks/02_design/04_updating_the_ui_based_on_orientation/main.dart';
import 'package:cookbooks_training/cookbooks/02_design/05_using_themes/main.dart';
import 'package:cookbooks_training/cookbooks/02_design/06_using_custom_fonts/main.dart';
import 'package:cookbooks_training/cookbooks/02_design/07_working_with_tabs/main.dart';

// Forms
import 'package:cookbooks_training/cookbooks/03_forms/main.dart';

// Gestures
import 'package:cookbooks_training/cookbooks/04_Gestures/main.dart';

// Lists
import 'package:cookbooks_training/cookbooks/05_Lists/01_basic_list/main.dart';
import 'package:cookbooks_training/cookbooks/05_Lists/02_horizontal_list/main.dart';
import 'package:cookbooks_training/cookbooks/05_Lists/03_grid_list/main.dart';
import 'package:cookbooks_training/cookbooks/05_Lists/04_different_types_list/main.dart';
import 'package:cookbooks_training/cookbooks/05_Lists/05_floating_app_bar_list/main.dart';
import 'package:cookbooks_training/cookbooks/05_Lists/06_long_list/main.dart';

// Maintenance
//import 'package:cookbooks_training/cookbooks/06_Maintenance/main.dart';

// Navigation
import 'package:cookbooks_training/cookbooks/07_navigation/03_navigate_with_named_routes/FirstScreen.dart';
import 'package:cookbooks_training/cookbooks/07_navigation/03_navigate_with_named_routes/SecondScreen.dart';

import "package:sentry/sentry.dart";
final SentryClient _sentry = SentryClient(
    dsn: "https://ef9785c2ace44b2a89eaa5595d9779f7@sentry.io/1483070");

bool get isInDebugMode {
  // Assume you're in production mode.
  bool inDebugMode = false;

  // Assert expressions are only evaluated during development. They are ignored
  // in production. Therefore, this code only sets `inDebugMode` to true
  // in a development environment.
//  assert(inDebugMode = true);

  return inDebugMode;
}

Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
  // Print the exception to the console.
  print('Caught error: $error');
  if (isInDebugMode) {
    // Print the full stacktrace in debug mode.
    print(stackTrace);
    return;
  } else {
    // Send the Exception and Stacktrace to Sentry in Production mode.
    _sentry.captureException(
      exception: error,
      stackTrace: stackTrace,
    );
  }
}

Future<Null> main() async {
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    }

    else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  runZoned<Future<Null>>(() async {
    runApp(new MyApp());
  }, onError: (error, stackTrace) async {
    print("*** SENDING ERRORS ***");
    await _reportError(error, stackTrace);
  });
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cookbooks',
      debugShowCheckedModeBanner: false,
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
        "/02_design/04_updating_the_ui_based_on_orientation/main" : (context) => AppOrientationUI(),
        "/02_design/05_using_themes/main" : (context) => AppTheme(),
        "/02_design/06_using_custom_fonts/main" : (context) => AppFont(),
        "/02_design/07_working_with_tabs/main" : (context) => AppTabs(),

        // Forms
        "/03_forms/main" : (context) => AppForm(),

        // Gestures
        "/04_gestures/main" : (context) => AppGesture(),

        // Lists
        "/05_lists/01_basic_list/main" : (context) => BasicListApp(),
        "/05_lists/02_horizontal_list/main" : (context) => HorizontalListApp(),
        "/05_lists/03_grid_list/main" : (context) => GridListApp(),
        "/05_lists/04_different_types_list/main" : (context) => DifferentTypesListApp(),
        "/05_lists/05_floating_app_bar_list/main" : (context) => FloatingAppBarListApp(),
        "/05_lists/06_long_list/main" : (context) => LongListApp(),

        // Navigation
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
          Column(
            children: <Widget>[
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
            ],
          ),

          // ---- 02 Design ----
          Column(
            children: <Widget>[
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
              buildRowItem(
                bookName: "04 Updating the UI based on orientation",
                bookRoute: "/02_design/04_updating_the_ui_based_on_orientation/main",
                context: context
              ),
              buildRowItem(
                bookName: "05 Using Themes",
                bookRoute: "/02_design/05_using_themes/main",
                context: context
              ),
              buildRowItem(
                bookName: "06 Using Custom Fonts",
                bookRoute: "/02_design/06_using_custom_fonts/main",
                context: context
              ),
              buildRowItem(
                bookName: "07 Working With Tabs",
                bookRoute: "/02_design/07_working_with_tabs/main",
                context: context
              ),
            ],
          ),

          // ---- 03 Forms ----
          Column(
            children: <Widget>[
              buildRowTitle("03. Forms", context),
              buildRowItem(
                bookName: "All forms",
                bookRoute: "/03_forms/main",
                context: context
              ),
            ],
          ),

          // ---- 04 Gestures ----
          Column(
            children: <Widget>[
              buildRowTitle("04. Gestures", context),
              buildRowItem(
                bookName: "03 Swipe to dismiss",
                bookRoute: "/04_gestures/main",
                context: context
              ),
            ],
          ),

          // ---- 05 List ----
          Column(
            children: <Widget>[
              buildRowTitle("05. Lists", context),
              buildRowItem(
                bookName: "01 Basic List",
                bookRoute: "/05_lists/01_basic_list/main",
                context: context
              ),
              buildRowItem(
                bookName: "02 Horizontal List",
                bookRoute: "/05_lists/02_horizontal_list/main",
                context: context
              ),
              buildRowItem(
                bookName: "03 Grid List",
                bookRoute: "/05_lists/03_grid_list/main",
                context: context
              ),
              buildRowItem(
                bookName: "04 Different Types List",
                bookRoute: "/05_lists/04_different_types_list/main",
                context: context
              ),
              buildRowItem(
                bookName: "05 Floating App Bar List",
                bookRoute: "/05_lists/05_floating_app_bar_list/main",
                context: context
              ),
              buildRowItem(
                bookName: "06 Long List",
                bookRoute: "/05_lists/06_long_list/main",
                context: context
              ),
            ],
          ),

          // ---- 06 Maintenance ----
          buildRowTitle("06. Maintenance", context),

          // ---- 07 Navigation ----
          Column(
            children: <Widget>[
              buildRowTitle("07. Navigation", context),
              buildRowItem(
                bookName: "03. Navigate with named routes",
                bookRoute:
                "/07_navigation/03_navigate_with_named_routes/firstScreen",
                context: context,
              )
            ],
          ),
        ],
      ),
    );
  }
}
