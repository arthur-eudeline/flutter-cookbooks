import 'package:flutter/material.dart';

class AppTabs extends StatefulWidget {
  _AppTabsState createState() => new _AppTabsState();
}

class _AppTabsState extends State<AppTabs> {
  // Todo screen title
  String _screenTitle = "App Tabs";

  Widget buildTutorial() {
    return TabBarView(
      children: [
        Icon(Icons.directions_car),
        Icon(Icons.directions_transit),
        Icon(Icons.directions_bike),
      ],
    );

  }

  void buttonAction() {
    // Todo button action
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_screenTitle),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.notifications),
                text: "Notifications",
              ),
              Tab(
                icon: Icon(Icons.shopping_cart),
                text: "Panier",
              ),
              Tab(
                icon: Icon(Icons.card_giftcard),
                text: "Mes Avantages",
              ),
            ],
          ),
        ),
        body: Center(child: buildTutorial()),
      ),
    );
  }
}
