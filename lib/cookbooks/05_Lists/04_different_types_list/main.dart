import 'package:flutter/material.dart';
import './ListItem.dart';

class DifferentTypesListApp extends StatefulWidget {

  _DifferentTypesListAppState createState() => new _DifferentTypesListAppState();
}

class _DifferentTypesListAppState extends State<DifferentTypesListApp> {

  // Todo screen title
  String _screenTitle = "Different item types list";

  final items = List<ListItem>.generate(
    1200,
        (i) => i % 6 == 0
        ? HeadingItem("Heading $i")
        : MessageItem("Sender $i", "Message body $i"),
  );

  Widget buildTutorial() {
    return ListView.builder(
      // Let the ListView know how many items it needs to build.
      itemCount: items.length,
      // Provide a builder function. This is where the magic happens.
      // Convert each item into a widget based on the type of item it is.
      itemBuilder: (context, index) {
        final item = items[index];

        if (item is HeadingItem) {
          return ListTile(
            title: Text(
              item.heading,
              style: Theme.of(context).textTheme.headline,
            ),
          );
        } else if (item is MessageItem) {
          return ListTile(
            title: Text(item.sender),
            subtitle: Text(item.body),
          );
        } else {
          return null;
        }
      },
    );
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